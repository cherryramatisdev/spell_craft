# frozen_string_literal: true
# typed: true

module Utils
  class Shell
    extend T::Sig

    sig { params(binary: String).returns(T::Boolean) }
    def self.binary_exists?(binary)
      File.executable?(File.join(ENV.fetch('PATH', '').split(':'), binary))
    end
  end
end
