# frozen_string_literal: true
# typed: true

module Cmd
  class Cli
    extend Dry::CLI::Registry

    register "version", Version, aliases: ["v", "-v", "--version"]
  end
end
