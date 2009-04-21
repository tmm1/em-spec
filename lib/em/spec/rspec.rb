module EventMachine
  module Spec
    module Rspec
      
      def self.spec( args, blk )
        context(args, &blk)
      end
      
    end
  end
end

require File.dirname(__FILE__) + '/../rspec/example_group_methods'