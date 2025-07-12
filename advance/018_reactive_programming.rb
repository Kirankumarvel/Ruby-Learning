# Simple Reactive Streams
require 'observer'

class EventStream
  include Observable

  def emit(value)
    changed
    notify_observers(value)
  end
end

class Logger
  def update(value)
    puts "Log: #{value}"
  end
end

stream = EventStream.new
stream.add_observer(Logger.new)
stream.emit("System started")
