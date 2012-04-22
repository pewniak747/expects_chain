module ExpectsChain
  module Mockers
    class Mocha < Base
      def expects method
        @object = @object.expects(method).at_least_once
        self
      end

      def stubs method
        @object = @object.stubs(method)
        self
      end

      def returns ret
        @object = @object.returns(ret)
      end

      def self.mock
        ::Mocha::Mock.new(nil)
      end

      def self.stub
        ::Mocha::Mock.new(nil)
      end
    end
  end
end
