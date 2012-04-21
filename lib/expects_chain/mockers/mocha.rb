module ExpectsChain
  module Mockers
    module Mocha
      def self.mock_object obj, method, ret
        obj.expects(method).at_least_once.returns(ret)
      end

      def self.mock_object_with_arguments obj, method, attrs, ret
        obj.expects(method).with(*attrs).at_least_once.returns(ret)
      end

      def self.stub_object
        obj.stubs(method).returns(ret)
      end

      def self.stub_object_with_arguments obj, method, attrs, ret
        obj.stubs(method).with(*attrs).at_least_once.returns(ret)
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
