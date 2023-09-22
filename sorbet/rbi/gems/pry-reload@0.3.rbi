# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `pry-reload` gem.
# Please instead update this file by running `bin/tapioca gem pry-reload`.

# source://pry-reload//lib/pry-reload/watch.rb#5
class PryReload; end

# source://pry-reload//lib/pry-reload/watch.rb#6
class PryReload::Watch
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  # @return [Watch] a new instance of Watch
  #
  # source://pry-reload//lib/pry-reload/watch.rb#11
  def initialize; end

  # source://pry-reload//lib/pry-reload/watch.rb#17
  def dirs; end

  # source://pry-reload//lib/pry-reload/watch.rb#28
  def process; end

  # source://pry-reload//lib/pry-reload/watch.rb#35
  def reload!(output); end

  # source://pry-reload//lib/pry-reload/watch.rb#21
  def setup; end

  class << self
    private

    def allocate; end
    def new(*_arg0); end
  end
end