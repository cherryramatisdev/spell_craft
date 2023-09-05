# typed: true

module Zeitwerk
  class Loader
    sig { params(path: Pathname).void }
    def push_dir(path); end

    def setup; end
  end
end
