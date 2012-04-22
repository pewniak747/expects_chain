require 'spec_helper'

describe ExpectsChain do
  before :each do
    @object = Object.new
  end

  it "should mock 2 calls" do
    @object.stubs_chain(:foo, :bar).returns(:baz)
    @object.foo.bar.should == :baz
  end

  it "should mock 3 calls" do
    @object.stubs_chain(:foo, :bar, :baz).returns(:boo)
    @object.foo.bar.baz.should == :boo
  end

  it "should mock 4 calls" do
    @object.stubs_chain(:foo, :bar, :baz, :boo).returns(:bum)
    @object.foo.bar.baz.boo.should == :bum
  end

  it "should mock calls with arguments" do
    @object.stubs_chain(:foo, [:bar, 1]).returns(:baz)
    @object.foo.bar(1).should == :baz
  end

  it "should mock calls with 2 arguments" do
    @object.stubs_chain(:foo, [:bar, 1, 2]).returns(:baz)
    @object.foo.bar(1, 2).should == :baz
  end

  it "should mock multiple calls with arguments" do
    @object.stubs_chain([:foo, 1], [:bar, 2, 3], [:baz, 4]).returns(:boo)
    @object.foo(1).bar(2, 3).baz(4).should == :boo
  end

  it "should raise proper exception of the class" do
    @object.stubs_chain(:foo, :bar, :baz).raises(StandardError)
    -> { @object.foo.bar.baz }.should raise_error(StandardError)
  end

  it "should raise proper exception" do
    @object.stubs_chain(:foo, :bar, :baz).raises(StandardError.new('this is an error'))
    begin @object.foo.bar.baz
    rescue => e
      e.message.should == 'this is an error'
      e.class.to_s.should == 'StandardError'
    end
  end
end
