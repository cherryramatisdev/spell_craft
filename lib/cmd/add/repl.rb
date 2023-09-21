# frozen_string_literal: true
# typed: true

require 'dry/monads/all'
require 'async'

module Cmd
  module Add
    class Repl < Dry::CLI::Command
      include Dry::Monads
      extend T::Sig

      desc 'Allow adding configuration for REPL support on the current application, being either pry or irb'

      option :irb, type: :boolean, default: true,
                   desc: '(This is the default): Enable the code generator to assume IRB as the REPL of choice'
      option :pry, type: :boolean, default: false,
                   desc: 'Enable the code generator to assume Pry as the REPL of choice'

      IRB_TEMPLATE = <<~CONTENT
        #!/usr/bin/env ruby

        # frozen_string_literal: true

        require 'irb'
        IRB.start
      CONTENT

      PRY_TEMPLATE = <<~CONTENT
        #!/usr/bin/env ruby

        require 'pry-reload'
        require 'pry'
        Pry.start
      CONTENT

      class ConfigType < T::Enum
        enums do
          IRB = new
          PRY = new
        end
      end

      def call(irb:, pry:)
        if pry
          response = install_deps

          if response.failure?
            # TODO: make this better with red message maybe.
            puts response.failure[:message]
            return
          end
        end

        write_config(type: ConfigType::IRB) if irb
        write_config(type: ConfigType::PRY) if pry
      end

      private

      sig { params(type: ConfigType).void }
      def write_config(type:)
        case type
        when ConfigType::IRB
          Utils::FileSystem.create_directory_if_not_exist('bin')

          File.write('bin/console', IRB_TEMPLATE)
        when ConfigType::PRY
          Utils::FileSystem.create_directory_if_not_exist('bin')

          File.write('bin/console', PRY_TEMPLATE)

          File.chmod(0o755, 'bin/console')
        end
      end

      sig { returns(T.any(Result::Success, Result::Failure)) }
      def install_deps
        unless File.exist?('Gemfile') || Utils::Shell.binary_exists?('bundle')
          return Result::Failure.new({ message: 'Gemfile don\'t exist or the bundle gem is not available' })
        end

        return Result::Success.new(true) if Utils::Gem.exists?('pry') || Utils::Gem.exists?('pry-reload')

        Async do
          system('bundle add pry')
          system('bundle add pry-reload')
        end

        Result::Success.new(true)
      end
    end
  end
end
