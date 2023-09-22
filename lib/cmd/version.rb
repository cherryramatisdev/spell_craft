# frozen_string_literal: true
# typed: true

require 'rubygems'

module Cmd
  class Version < Dry::CLI::Command
    desc 'Print version'

    def call
      puts Gem::Specification.load('spell_craft.gemspec').version
    end
  end
end
