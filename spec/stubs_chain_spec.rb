require 'spec_helper'

describe ExpectsChain do
  before :each do
    @object = OpenStruct.new
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
end
