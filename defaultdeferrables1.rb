require "rubygems"
require "eventmachine"

EM.run do 
  df = EM::DefaultDeferrable.new
  df.callback do |name|
    puts "Hello #{name}"
    df.succeed("Dan", "Whatever!")
  end

  df.callback do |name, type|
    puts "#{name} made a peepcode #{type}"
    df.succeed("dfgd", "Whatever!")
  end

  #df.callback { EM.stop }

  EM.add_timer(2) { df.succeed("Dan") }

end
