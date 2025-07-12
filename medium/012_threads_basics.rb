# Threads Basics

# Basic thread creation
threads = []
5.times do |i|
  threads << Thread.new(i) do |num|
    sleep rand(0.1..0.5)
    puts "Thread #{num} completed"
  end
end

threads.each(&:join)
puts "All threads completed"

# Shared data and mutex
shared_counter = 0
mutex = Mutex.new

increment_threads = 10.times.map do
  Thread.new do
    1000.times do
      mutex.synchronize do
        shared_counter += 1
      end
    end
  end
end

increment_threads.each(&:join)
puts "Final counter value (with mutex): #{shared_counter}"

# Without mutex (demonstrates race condition)
broken_counter = 0
broken_threads = 10.times.map do
  Thread.new do
    1000.times do
      broken_counter += 1
    end
  end
end

broken_threads.each(&:join)
puts "Final counter value (no mutex): #{broken_counter}"

# Thread-local variables
thread = Thread.new do
  Thread.current[:message] = "Hello from thread"
  puts Thread.current[:message]
end

thread.join

# Thread pools with Queue
require 'thread'

work_queue = Queue.new
results = []
mutex = Mutex.new

# Producer
producer = Thread.new do
  10.times do |i|
    sleep 0.1
    work_queue << i
  end
  3.times { work_queue << :done }
end

# Consumers
consumers = 3.times.map do
  Thread.new do
    while true
      item = work_queue.pop
      break if item == :done
      
      result = item * 2
      mutex.synchronize { results << result }
    end
  end
end

consumers.each(&:join)
puts "Results: #{results.sort.inspect}"
