require "rubygems"
require "eventmachine"

class MyDef
  include EM::Deferrable

  def my_function(succeed)
    if succeed
      set_deferred_status :succeeded
    else
      set_deferred_status :failed
    end
  end

end

EM.run do
  md1 = MyDef.new
  md1.callback { puts "MD1 succeeded" }
  md1.callback { puts "MD1 succeeded 1" }
  md1.callback { puts "MD1 succeeded 2" }
  md1.errback { puts "MD1 failed" }

  md2 = MyDef.new
  md2.callback { puts "MD2 succeeded" }
  md2.errback { puts "MD2 failed" }

  EM.add_timer(2) do
    md1.my_function(true)
    md2.my_function(false)
  end
end
