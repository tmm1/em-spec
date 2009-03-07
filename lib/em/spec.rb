require File.dirname(__FILE__) + '/../ext/fiber18'
require 'rubygems'
require 'eventmachine'

module EventMachine
  
  def self.spec_backend=( backend )
    @spec_backend = backend
  end
  
  def self.spec_backend
    @spec_backend
  end
  
  def self.spec *args, &blk
    raise ArgumentError, 'block required' unless block_given?
    raise 'EventMachine reactor already running' if EM.reactor_running?

    spec_backend.spec( args, blk )
  end
  class << self; alias :describe :spec; end

  def self.rspec( *args, &block )
    require File.dirname(__FILE__) + '/spec/rspec'
    self.spec_backend = EventMachine::Spec::Rspec
    self.spec( args, &block )
  end
  
  def self.bacon( *args, &block )
    require File.dirname(__FILE__) + '/spec/bacon'
    self.spec_backend = EventMachine::Spec::Bacon
    self.spec( args, &block )
  end

end