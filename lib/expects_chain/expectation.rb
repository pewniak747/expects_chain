module ExpectsChain
  class Expectation
    def initialize type, object, *args
      @type = type
      @object = object
      @expectations = args 
    end

    def returns value
      set_up_call_chain value
      value
    end

    def self.mocker
      if @_mocker.nil?
        framework = RSpec.configuration.mock_framework.framework_name.to_s.capitalize.to_sym
        raise StandardError.new("expects_chain unsupported framework: #{framework}") unless Mockers.constants.include?(framework)
        @_mocker = Mockers::const_get(framework)
      end
      @_mocker
    end

    private

    def set_up_call_chain value
      current_mock = value
      first_expectation = @expectations.shift
      @expectations.reverse.each do |expectation|
        old_mock, current_mock = current_mock, mocker.send(@type)
        set_expectation(current_mock, expectation, old_mock)
      end
      set_expectation(@object, first_expectation, current_mock)
    end

    def set_expectation obj, method, ret
      type = (@type == :mock ? :expects : :stubs)
      rtype = :returns
      if method.kind_of?(Array) && method.first.kind_of?(Symbol)
        mocker.new(obj).send(type, method.shift).with(method).send(rtype, ret)
      else
        mocker.new(obj).send(type, method).send(rtype, ret)
      end
    end

    def mocker
      self.class.mocker
    end
  end
end
