require 'spec_helper'

describe ActsAsPercentage do
  class DummyClass
    attr_accessor :test_fee

    include ActsAsPercentage
    acts_as_percentage_on :test_fee
  end

  before(:each) do
    @dummy_class = DummyClass.new
  end

  describe '#acts_as_percentage_on' do
    it 'will make a getter' do
      expect(@dummy_class).to respond_to(:test_fee_percentage)
    end

    it 'will make a setter' do
      expect(@dummy_class).to respond_to(:test_fee_percentage=)
    end
  end

  describe 'the getter' do
    it 'multiplies by 100' do
      @dummy_class.test_fee = 2.10
      expect(@dummy_class.test_fee_percentage).to eq(210)
    end

    it 'returns 0 if nil' do
      expect(@dummy_class.test_fee_percentage).to eq(0)
    end
  end

  describe 'the setter' do
    it 'divides by 100' do
      @dummy_class.test_fee_percentage = '137'
      expect(@dummy_class.test_fee).to eq(1.37)
    end

    it 'sets 0 for nil' do
      @dummy_class.test_fee_percentage = nil
      expect(@dummy_class.test_fee).to eq(0.0)
    end
  end
end
