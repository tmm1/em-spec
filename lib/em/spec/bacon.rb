module EventMachine
  module Spec
    module Bacon
      
      def self.spec( args, blk )
        EM.run do
          ::Bacon.summary_on_exit
          ($em_spec_fiber = Fiber.new{
                              ::Bacon::FiberedContext.new(args.join(' '), &blk).run
                              EM.stop_event_loop
                            }).resume
        end
      end
      
    end
  end
end

class Bacon::FiberedContext < Bacon::Context
  def it *args
    super{
      if block_given?
        yield
        Fiber.yield
      end
    }
  end

  def done
    EM.next_tick{
      :done.should == :done
      $em_spec_fiber.resume if $em_spec_fiber
    }
  end
end