require File.dirname(__FILE__) + '/../lib/em/spec'
require 'bacon'
require File.dirname(__FILE__) + '/../lib/em/spec/bacon'

EM.spec_backend = EventMachine::Spec::Bacon

describe 'Bacon' do
  should 'work as normal outside EM.describe' do
    1.should == 1
  end
end

EM.describe EventMachine do
  should 'work' do
    done
  end

  should 'have timers' do
    start = Time.now

    EM.add_timer(0.5){
      (Time.now-start).should.be.close 0.5, 0.1
      done
    }
  end

  should 'have periodic timers' do
    num = 0
    start = Time.now

    timer = EM.add_periodic_timer(0.5){
      if (num += 1) == 2
        (Time.now-start).should.be.close 1.0, 0.1
        EM.__send__ :cancel_timer, timer
        done
      end
    }
  end

  should 'have deferrables' do
    defr = EM::DefaultDeferrable.new
    defr.timeout(1)
    defr.errback{
      done
    }
  end
  
  describe 'subscope' do
    should 'have timers here too' do
      start = Time.now

      EM.add_timer(0.5){
        (Time.now-start).should.be.close 0.5, 0.1
        done
      }
    end
  end

  # it "should not block on failure" do
  #   1.should == 2
  # end

end