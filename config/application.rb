# frozen_string_literal: true
# typed: true

require 'zeitwerk'
require 'pathname'

root = Pathname('.')

loader = Zeitwerk::Loader.new

loader.push_dir(root.join('lib').realpath)
loader.push_dir(root.join('config').realpath)

loader.setup
