module EventMachine
  module Spec
    module Rspec
      
      def self.spec( args, blk )
        context(args, &blk)
      end
      
    end
  end
end

module Spec
  module Example
    module ExampleMethods
      
      alias :original_execute :execute
      def execute(options, instance_variables)
        begin
          success = original_execute(options, instance_variables)
        ensure
          resume_on_error unless success
          Fiber.yield
        end
      end
      
      def done
        EM.next_tick{
          :done.should == :done
          $em_spec_fiber.resume if $em_spec_fiber
        }
      end      
      
      private
      
        def resume_on_error
          EM.next_tick{
            $em_spec_fiber.resume if $em_spec_fiber
          }
        end
      
    end
    
    module ExampleGroupMethods

      alias :run_without_em :run
      def run( run_options )
        if options[:scope] == EventMachine::Spec::Rspec
          EM.run do
            run_in_fiber( run_options )
          end
        else
          run_in_fiber( run_options )
        end    
        true
      end

      private
      
        def run_in_fiber( run_options )
          ($em_spec_fiber = Fiber.new{
            run_without_em( run_options )
            EM.stop_event_loop if EM.reactor_running?
          }).resume   
        end  

    end
  end
end