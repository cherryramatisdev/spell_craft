# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require "dry/cli"

require_relative 'config/application'

Dry::CLI.new(Cmd::Cli).call
