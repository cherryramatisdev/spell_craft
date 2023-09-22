# frozen_string_literal: true
# typed: true

module Utils
  class Gem
    extend T::Sig

    sig { params(name: String).returns(T::Boolean) }
    def self.exists?(name)
      gemfile_content = File.read('Gemfile')

      pattern = /gem\s+['"]#{name}['"]/
      !gemfile_content.scan(pattern).empty?
    end

    sig { returns(T::Boolean) }
    def self.gemfile_exist?
      File.exist?('Gemfile')
    end
  end
end
