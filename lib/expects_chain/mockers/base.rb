module ExpectsChain
  module Mockers
    class Base
      def initialize obj
        @object = obj
      end

      def with args
        @object = @object.with(*args)
        self
      end

      private

      def generate_exception object
        object.is_a?(Class) ? object.new : object
      end
    end
  end
end
