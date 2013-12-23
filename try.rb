require 'rubygems'
require 'eventmachine'

EM.run do
  op = Proc.new do 
    puts "OPERATION"
    [1,2]
  end
  cb = Proc.new do |first, second|
    puts "CALLBACK #{first} #{second}"
  end

  EM.defer(op, cb)
end
