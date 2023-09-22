# frozen_string_literal: true
# typed: true

require 'async'

module Cmd
  module Add
    class Autoload < Dry::CLI::Command
      extend T::Sig

      desc 'Allow adding configuration for Autoloading and autorequiring on the current application, being either plain zeitwerk or dry-system + zeitwerk'

      option :dry_system, type: :boolean, default: false,
                          desc: 'Enable the code generator to assume dry-system + zeitwerk configuration'

      ZEITWERK_TEMPLATE = <<~CONTENT
        # frozen_string_literal: true

        require 'zeitwerk'
        require 'pathname'

        root = Pathname('.')

        loader = Zeitwerk::Loader.new

        loader.push_dir(root.join('lib').realpath)
        loader.push_dir(root.join('config').realpath)

        loader.setup
      CONTENT

      DRY_SYSTEM_TEMPLATE = <<~CONTENT
        # frozen_string_literal: true

        require 'dry/system'

        # Application configure all the paths to be autoloaded and auto injectable.
        class Application < Dry::System::Container
          configure do |config|
            config.root = Pathname('.')

            config.component_dirs.loader = Dry::System::Loader::Autoloading

            config.component_dirs.add 'lib'
            config.component_dirs.add 'config'
          end
        end

        loader = Zeitwerk::Loader.new
        loader.push_dir(Application.config.root.join('lib').realpath)
        loader.push_dir(Application.config.root.join('config').realpath)
        loader.setup
      CONTENT

      class DepsType < T::Enum
        enums do
          DRY_SYSTEM = new
          ZEITWERK = new
        end
      end

      sig { params(dry_system: T::Boolean).void }
      def call(dry_system:)
        return puts 'Could not locate Gemfile' unless Utils::Gem.gemfile_exist?

        Utils::FileSystem.create_directory_if_not_exist('config')

        if dry_system
          File.write('config/application.rb', DRY_SYSTEM_TEMPLATE)

          install_deps(DepsType::DRY_SYSTEM)
        end

        return if dry_system

        File.write('config/application.rb', ZEITWERK_TEMPLATE)

        install_deps(DepsType::ZEITWERK)
      end

      private

      sig { params(type: DepsType).void }
      def install_deps(type)
        if Utils::Gem.exists?('dry-system') || Utils::Gem.exists?('zeitwerk') || Utils::Gem.exists?('dry-auto_inject')
          return
        end

        pkgs = T.let(['zeitwerk'], T::Array[String])

        pkgs.push('dry-system', 'dry-auto_inject') if type == DepsType::DRY_SYSTEM

        Async do
          pkgs.each do |pkg|
            system("bundle add #{pkg}")
          end
        end
      end
    end
  end
end
