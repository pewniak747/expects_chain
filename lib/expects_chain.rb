# encoding: utf-8

require 'expects_chain/expectation'
require 'expects_chain/mockers/mocha'
require 'expects_chain/mockers/rspec'

module ExpectsChain
  module Methods
    def expects_chain *args
      ExpectsChain::Expectation.new(:mock, self, *args) 
    end

    def stubs_chain *args
      ExpectsChain::Expectation.new(:stub, self, *args) 
    end
  end
end

class Object
  include ExpectsChain::Methods 
end
