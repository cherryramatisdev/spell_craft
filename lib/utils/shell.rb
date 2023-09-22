# frozen_string_literal: true
# typed: true

module Utils
  class Shell
    extend T::Sig

    sig { params(binary: String).returns(T::Boolean) }
    def self.binary_exists?(binary)
      File.executable?(File.join(ENV.fetch('PATH', '').split(':'), binary))
      path_dirs = ENV.fetch('PATH', '').split(File::PATH_SEPARATOR)

      !path_dirs.find do |dir|
        File.exist?(File.join(dir, binary)) && !File.directory?(File.join(dir, binary))
      end.nil?
    end
  end
end
