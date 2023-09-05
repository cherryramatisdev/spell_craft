# frozen_string_literal: true
# typed: true

module Cmd
  class Version < Dry::CLI::Command
    desc "Print version"

    def call
      puts "0.0.1"
    end
  end
end
