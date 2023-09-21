# frozen_string_literal: true
# typed: true

module Utils
  class FileSystem
    extend T::Sig

    sig { params(name: String).returns(T::Boolean) }
    def self.create_directory_if_not_exist(name)
      return true if File.directory?(name)

      begin
        Dir.mkdir(name)
        true
      rescue SystemCallError
        false
      end
    end
  end
end
