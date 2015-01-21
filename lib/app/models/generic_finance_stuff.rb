# This is an example class.

class GenericFinanceStuff < ActiveRecord::Base
  include ActsAsPercentage

  validates :credit_card_rate, :commission, presence: true

  acts_as_percentage_on :credit_card_rate, :commission
end