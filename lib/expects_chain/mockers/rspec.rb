module ExpectsChain
  module Mockers
    class Rspec < Base
      def expects method
        @object = @object.should_receive(method)
        self
      end

      def stubs method
        @object = @object.stub(method)
        self
      end

      def returns ret
        @object = @object.and_return(ret)
      end

      def self.mock
        ::RSpec::Mocks::Mock.new(nil)
      end

      def self.stub
        ::RSpec::Mocks::Mock.new(nil)
      end
    end
  end
end
