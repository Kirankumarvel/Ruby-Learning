# Advanced ActiveRecord Patterns
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :name
    t.integer :score
  end
end

class User < ActiveRecord::Base
  scope :high_scores, -> { where('score > ?', 100) }
end

# Connection pooling demonstration
5.times.map do |i|
  Thread.new do
    User.create(name: "User #{i}", score: rand(200))
  end
end.each(&:join)

puts "High scores: #{User.high_scores.count}"
