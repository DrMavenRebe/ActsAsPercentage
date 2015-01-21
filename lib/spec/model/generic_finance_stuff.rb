require 'spec_helper'

describe GlobalFinancialSettings do
  let!(:global_financial_setting) { FactoryGirl.build(:global_financial_settings) }

  it "should be valid" do
    global_financial_setting.should be_valid
  end

  it "should be invalid" do
    global_financial_setting.swipe_fee_cents = nil
    global_financial_setting.should be_invalid
  end

  describe "acts as a percentage for" do
    it_should_behave_like ActsAsPercentage, [:credit_card_rate, :delivery_fee_margin, :managed_service_commission_rate] do
      let(:precentable) { global_financial_setting }
    end
  end
end