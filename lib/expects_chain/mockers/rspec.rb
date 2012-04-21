module ExpectsChain
  module Mockers
    module Rspec
      def self.mock_object obj, method, ret
        obj.should_receive(method).and_return(ret)
      end

      def self.mock_object_with_arguments obj, method, attrs, ret
        obj.should_receive(method).with(*attrs).and_return(ret)
      end

      def self.stub_object obj, method, ret
        obj.stub!(method).and_return(ret)
      end

      def self.stub_object_with_arguments obj, method, attrs, ret
        obj.stub!(method).with(*attrs).and_return(ret)
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
