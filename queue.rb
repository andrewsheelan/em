require 'rubygems'
require 'eventmachine'

EM.run do
  q = EM::Queue.new
  q.push(:one, :two, :three)
  3.times do
    q.pop do |item|
      puts item
    end
  end
end
