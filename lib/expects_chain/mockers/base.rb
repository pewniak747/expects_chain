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
    end
  end
end
