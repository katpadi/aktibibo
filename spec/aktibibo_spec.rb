require 'spec_helper'

describe Aktibibo do
  before(:each) do
    clean_database
    3.times do
      Foo.create!(name: (0...8).map { (65 + rand(26)).chr }.join)
    end
  end

  it 'Has a version number' do
    expect(Aktibibo::VERSION).not_to be nil
  end

  context 'Model method' do 
    it 'has activatable method' do
      expect(Foo.respond_to? :activatable).to be_truthy
    end
  end

  context 'It does its job' do
    it 'Is inactive' do
      expect(Foo.first.inactive?).to be_truthy
    end
    it 'Is active' do
      foo = Foo.first
      foo.activate
      expect(foo.active?).to be_truthy
    end
    it 'Is deactivated' do
      foo = Foo.first
      foo.deactivate
      expect(foo.deactivated?).to be_truthy
    end
  end

  it 'Fills dates respectively' do
    foo = Foo.first
    foo.activate!
    expect(foo.activated_at).to_not be_nil
    expect(foo.deactivated_at).to be_nil
    foo.deactivate!
    expect(foo.deactivated_at).to_not be_nil
    expect(foo.activated_at).to_not be_nil
  end

  context 'It has non-bang methods' do
    it 'Does not raise error when deactivating deactivated' do 
      foo = Foo.first
      foo.deactivate!
      expect{foo.deactivate}.to_not raise_error
    end
    it "Does not raise error when activating activated" do 
      foo = Foo.first
      foo.activate!
      expect{foo.activate}.to_not raise_error 
    end
  end  

  context 'It bangs on same state' do
    it 'Raises error when deactivating deactivated' do 
      foo = Foo.first
      foo.deactivate!
      expect{foo.deactivate!}.to raise_error Aktibibo::Errors::AlreadyDeactivated
    end
    it 'Raises error when activating activated' do 
      foo = Foo.first
      foo.activate!
      expect{foo.activate!}.to raise_error Aktibibo::Errors::AlreadyActivated
    end
  end  
end