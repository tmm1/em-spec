require File.dirname(__FILE__) + '/../lib/em/spec'
require 'spec'
require File.dirname(__FILE__) + '/../lib/em/spec/rspec'

EM.spec_backend = EventMachine::Spec::Rspec

describe 'Rspec' do
  it 'should work as normal outside EM.describe' do
    1.should == 1
  end
end

EM.describe EventMachine do
  it 'should work' do
    done
  end

  it 'should have timers' do
    start = Time.now

    EM.add_timer(0.5){
      (Time.now-start).should be_close( 0.5, 0.1 )
      done
    }
  end

  it 'should have periodic timers' do
    num = 0
    start = Time.now

    timer = EM.add_periodic_timer(0.5){
      if (num += 1) == 2
        (Time.now-start).should be_close( 1.0, 0.1 )
        EM.__send__ :cancel_timer, timer
        done
      end
    }
  end

  it 'should have deferrables' do
    defr = EM::DefaultDeferrable.new
    defr.timeout(1)
    defr.errback{
      done
    }
  end
       
end