# Simple Blockchain Implementation
require 'digest'
require 'json'

class Block
  attr_reader :index, :timestamp, :data, :previous_hash, :hash

  def initialize(index, data, previous_hash)
    @index = index
    @timestamp = Time.now
    @data = data
    @previous_hash = previous_hash
    @hash = calculate_hash
  end

  def calculate_hash
    Digest::SHA256.hexdigest({
      index: @index,
      timestamp: @timestamp,
      data: @data,
      previous_hash: @previous_hash
    }.to_json)
  end
end

# Create blockchain
blockchain = [Block.new(0, "Genesis", "0")]
blockchain << Block.new(1, "Transaction 1", blockchain.last.hash)

# Verify chain
valid = blockchain.each_cons(2).all? do |a, b|
  b.previous_hash == a.hash && b.hash == b.calculate_hash
end

puts "Chain valid? #{valid}"
