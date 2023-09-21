# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `io-event` gem.
# Please instead update this file by running `bin/tapioca gem io-event`.

# source://io-event//lib/io/event/version.rb#6
class IO
  include ::Enumerable
  include ::File::Constants
end

class IO::Buffer
  include ::Comparable

  def initialize(*_arg0); end

  def &(_arg0); end
  def <=>(_arg0); end
  def ^(_arg0); end
  def and!(_arg0); end
  def clear(*_arg0); end
  def copy(*_arg0); end
  def each(*_arg0); end
  def each_byte(*_arg0); end
  def empty?; end
  def external?; end
  def free; end
  def get_string(*_arg0); end
  def get_value(_arg0, _arg1); end
  def get_values(_arg0, _arg1); end
  def hexdump; end
  def inspect; end
  def internal?; end
  def locked; end
  def locked?; end
  def mapped?; end
  def not!; end
  def null?; end
  def or!(_arg0); end
  def pread(*_arg0); end
  def pwrite(*_arg0); end
  def read(*_arg0); end
  def readonly?; end
  def resize(_arg0); end
  def set_string(*_arg0); end
  def set_value(_arg0, _arg1, _arg2); end
  def set_values(_arg0, _arg1, _arg2); end
  def shared?; end
  def size; end
  def slice(*_arg0); end
  def to_s; end
  def transfer; end
  def valid?; end
  def values(*_arg0); end
  def write(*_arg0); end
  def xor!(_arg0); end
  def |(_arg0); end
  def ~; end

  private

  def initialize_copy(_arg0); end

  class << self
    def for(_arg0); end
    def map(*_arg0); end
    def size_of(_arg0); end
  end
end

class IO::Buffer::AccessError < ::RuntimeError; end
class IO::Buffer::AllocationError < ::RuntimeError; end
IO::Buffer::BIG_ENDIAN = T.let(T.unsafe(nil), Integer)
IO::Buffer::DEFAULT_SIZE = T.let(T.unsafe(nil), Integer)
IO::Buffer::EXTERNAL = T.let(T.unsafe(nil), Integer)
IO::Buffer::HOST_ENDIAN = T.let(T.unsafe(nil), Integer)
IO::Buffer::INTERNAL = T.let(T.unsafe(nil), Integer)
class IO::Buffer::InvalidatedError < ::RuntimeError; end
IO::Buffer::LITTLE_ENDIAN = T.let(T.unsafe(nil), Integer)
IO::Buffer::LOCKED = T.let(T.unsafe(nil), Integer)
class IO::Buffer::LockedError < ::RuntimeError; end
IO::Buffer::MAPPED = T.let(T.unsafe(nil), Integer)
class IO::Buffer::MaskError < ::ArgumentError; end
IO::Buffer::NETWORK_ENDIAN = T.let(T.unsafe(nil), Integer)
IO::Buffer::PAGE_SIZE = T.let(T.unsafe(nil), Integer)
IO::Buffer::PRIVATE = T.let(T.unsafe(nil), Integer)
IO::Buffer::READONLY = T.let(T.unsafe(nil), Integer)
IO::Buffer::SHARED = T.let(T.unsafe(nil), Integer)

class IO::ConsoleMode
  def echo=(_arg0); end
  def raw(*_arg0); end
  def raw!(*_arg0); end

  private

  def initialize_copy(_arg0); end
end

class IO::EAGAINWaitReadable < ::Errno::EAGAIN
  include ::IO::WaitReadable
end

class IO::EAGAINWaitWritable < ::Errno::EAGAIN
  include ::IO::WaitWritable
end

class IO::EINPROGRESSWaitReadable < ::Errno::EINPROGRESS
  include ::IO::WaitReadable
end

class IO::EINPROGRESSWaitWritable < ::Errno::EINPROGRESS
  include ::IO::WaitWritable
end

IO::EWOULDBLOCKWaitReadable = IO::EAGAINWaitReadable
IO::EWOULDBLOCKWaitWritable = IO::EAGAINWaitWritable

# source://io-event//lib/io/event/version.rb#7
module IO::Event; end

# source://io-event//lib/io/event/debug/selector.rb#9
module IO::Event::Debug; end

# Enforces the selector interface and delegates operations to a wrapped selector instance.
#
# source://io-event//lib/io/event/debug/selector.rb#11
class IO::Event::Debug::Selector
  # @return [Selector] a new instance of Selector
  #
  # source://io-event//lib/io/event/debug/selector.rb#12
  def initialize(selector); end

  # source://io-event//lib/io/event/debug/selector.rb#28
  def close; end

  # source://io-event//lib/io/event/debug/selector.rb#70
  def io_read(*_arg0, **_arg1, &_arg2); end

  # source://io-event//lib/io/event/debug/selector.rb#66
  def io_wait(fiber, io, events); end

  # source://io-event//lib/io/event/debug/selector.rb#74
  def io_write(*_arg0, **_arg1, &_arg2); end

  # source://io-event//lib/io/event/debug/selector.rb#62
  def process_wait(*arguments); end

  # source://io-event//lib/io/event/debug/selector.rb#50
  def push(fiber); end

  # source://io-event//lib/io/event/debug/selector.rb#54
  def raise(fiber, *arguments); end

  # @return [Boolean]
  #
  # source://io-event//lib/io/event/debug/selector.rb#58
  def ready?; end

  # @return [Boolean]
  #
  # source://io-event//lib/io/event/debug/selector.rb#78
  def respond_to?(name, include_private = T.unsafe(nil)); end

  # source://io-event//lib/io/event/debug/selector.rb#42
  def resume(*arguments); end

  # source://io-event//lib/io/event/debug/selector.rb#82
  def select(duration = T.unsafe(nil)); end

  # Transfer from the calling fiber to the event loop.
  #
  # source://io-event//lib/io/event/debug/selector.rb#38
  def transfer; end

  # source://io-event//lib/io/event/debug/selector.rb#24
  def wakeup; end

  # source://io-event//lib/io/event/debug/selector.rb#46
  def yield; end
end

# A thread safe synchronisation primative.
#
# source://io-event//lib/io/event/interrupt.rb#8
class IO::Event::Interrupt
  # @return [Interrupt] a new instance of Interrupt
  #
  # source://io-event//lib/io/event/interrupt.rb#13
  def initialize(selector); end

  # source://io-event//lib/io/event/interrupt.rb#36
  def close; end

  # Send a sigle byte interrupt.
  #
  # source://io-event//lib/io/event/interrupt.rb#29
  def signal; end

  class << self
    # source://io-event//lib/io/event/interrupt.rb#9
    def attach(selector); end
  end
end

# source://io-event//lib/io/event/selector/select.rb#11
module IO::Event::Selector
  class << self
    # source://io-event//lib/io/event/selector.rb#12
    def default(env = T.unsafe(nil)); end

    # source://io-event//lib/io/event/selector.rb#28
    def new(loop, env = T.unsafe(nil)); end

    def nonblock(_arg0); end
  end
end

class IO::Event::Selector::KQueue
  def initialize(_arg0); end

  def close; end
  def io_read(*_arg0); end
  def io_wait(_arg0, _arg1, _arg2); end
  def io_write(*_arg0); end
  def loop; end
  def process_wait(_arg0, _arg1, _arg2); end
  def push(_arg0); end
  def raise(*_arg0); end
  def ready?; end
  def resume(*_arg0); end
  def select(_arg0); end
  def transfer; end
  def wakeup; end
  def yield; end
end

# source://io-event//lib/io/event/selector/select.rb#12
class IO::Event::Selector::Select
  # @return [Select] a new instance of Select
  #
  # source://io-event//lib/io/event/selector/select.rb#13
  def initialize(loop); end

  # @return [Boolean]
  #
  # source://io-event//lib/io/event/selector/select.rb#159
  def again?(errno); end

  # source://io-event//lib/io/event/selector/select.rb#37
  def close; end

  # Ruby <= 3.1, limited IO::Buffer support.
  #
  # source://io-event//lib/io/event/selector/select.rb#223
  def io_read(fiber, io, buffer, length, offset = T.unsafe(nil)); end

  # source://io-event//lib/io/event/selector/select.rb#150
  def io_select(readable, writable, priority, timeout); end

  # source://io-event//lib/io/event/selector/select.rb#142
  def io_wait(fiber, io, events); end

  # source://io-event//lib/io/event/selector/select.rb#252
  def io_write(fiber, io, buffer, length, offset = T.unsafe(nil)); end

  # Returns the value of attribute loop.
  #
  # source://io-event//lib/io/event/selector/select.rb#24
  def loop; end

  # source://io-event//lib/io/event/selector/select.rb#366
  def process_wait(fiber, pid, flags); end

  # Append the given fiber into the ready list.
  #
  # source://io-event//lib/io/event/selector/select.rb#84
  def push(fiber); end

  # Transfer to the given fiber and raise an exception. Put the current fiber into the ready list.
  #
  # source://io-event//lib/io/event/selector/select.rb#89
  def raise(fiber, *arguments); end

  # @return [Boolean]
  #
  # source://io-event//lib/io/event/selector/select.rb#98
  def ready?; end

  # Transfer from the current fiber to the specified fiber. Put the current fiber into the ready list.
  #
  # source://io-event//lib/io/event/selector/select.rb#64
  def resume(fiber, *arguments); end

  # source://io-event//lib/io/event/selector/select.rb#385
  def select(duration = T.unsafe(nil)); end

  # Transfer from the current fiber to the event loop.
  #
  # source://io-event//lib/io/event/selector/select.rb#59
  def transfer; end

  # If the event loop is currently sleeping, wake it up.
  #
  # source://io-event//lib/io/event/selector/select.rb#27
  def wakeup; end

  # Yield from the current fiber back to the event loop. Put the current fiber into the ready list.
  #
  # source://io-event//lib/io/event/selector/select.rb#74
  def yield; end

  private

  # source://io-event//lib/io/event/selector/select.rb#372
  def pop_ready; end
end

# source://io-event//lib/io/event/selector/select.rb#156
IO::Event::Selector::Select::EAGAIN = T.let(T.unsafe(nil), Integer)

# source://io-event//lib/io/event/selector/select.rb#157
IO::Event::Selector::Select::EWOULDBLOCK = T.let(T.unsafe(nil), Integer)

# source://io-event//lib/io/event/selector/select.rb#44
class IO::Event::Selector::Select::Optional < ::Struct
  # @return [Boolean]
  #
  # source://io-event//lib/io/event/selector/select.rb#49
  def alive?; end

  # Returns the value of attribute fiber
  #
  # @return [Object] the current value of fiber
  def fiber; end

  # Sets the attribute fiber
  #
  # @param value [Object] the value to set the attribute fiber to.
  # @return [Object] the newly set value
  def fiber=(_); end

  # source://io-event//lib/io/event/selector/select.rb#53
  def nullify; end

  # source://io-event//lib/io/event/selector/select.rb#45
  def transfer(*arguments); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# source://io-event//lib/io/event/selector/select.rb#102
class IO::Event::Selector::Select::Waiter < ::Struct
  # @return [Boolean]
  #
  # source://io-event//lib/io/event/selector/select.rb#103
  def alive?; end

  # Dispatch the given events to the list of waiting fibers. If the fiber was not waiting for the given events, it is reactivated by calling the given block.
  #
  # source://io-event//lib/io/event/selector/select.rb#108
  def dispatch(events, &reactivate); end

  # source://io-event//lib/io/event/selector/select.rb#133
  def each(&block); end

  # Returns the value of attribute events
  #
  # @return [Object] the current value of events
  def events; end

  # Sets the attribute events
  #
  # @param value [Object] the value to set the attribute events to.
  # @return [Object] the newly set value
  def events=(_); end

  # Returns the value of attribute fiber
  #
  # @return [Object] the current value of fiber
  def fiber; end

  # Sets the attribute fiber
  #
  # @param value [Object] the value to set the attribute fiber to.
  # @return [Object] the newly set value
  def fiber=(_); end

  # source://io-event//lib/io/event/selector/select.rb#129
  def invalidate; end

  # Returns the value of attribute tail
  #
  # @return [Object] the current value of tail
  def tail; end

  # Sets the attribute tail
  #
  # @param value [Object] the value to set the attribute tail to.
  # @return [Object] the newly set value
  def tail=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# source://io-event//lib/io/event/support.rb#8
module IO::Event::Support
  class << self
    # @return [Boolean]
    #
    # source://io-event//lib/io/event/support.rb#9
    def buffer?; end

    # @return [Boolean]
    #
    # source://io-event//lib/io/event/support.rb#13
    def fiber_scheduler_v1?; end

    # @return [Boolean]
    #
    # source://io-event//lib/io/event/support.rb#17
    def fiber_scheduler_v2?; end

    # @return [Boolean]
    #
    # source://io-event//lib/io/event/support.rb#21
    def fiber_scheduler_v3?; end
  end
end

# source://io-event//lib/io/event/version.rb#8
IO::Event::VERSION = T.let(T.unsafe(nil), String)

IO::PRIORITY = T.let(T.unsafe(nil), Integer)
IO::READABLE = T.let(T.unsafe(nil), Integer)
class IO::TimeoutError < ::IOError; end
IO::WRITABLE = T.let(T.unsafe(nil), Integer)
