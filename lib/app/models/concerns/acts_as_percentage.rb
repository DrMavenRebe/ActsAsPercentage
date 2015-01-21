# This is the only relevant file in the /app directory. Everything else here is
# just an example.

module ActsAsPercentage
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_percentage_on(*fields)
      fields.each do |field|
        define_method("#{field}_percentage=") do |argument|
          percentage = argument.to_f/100.0
          send("#{field}=", percentage)
        end

        define_method("#{field}_percentage") do
          100.0 * (send("#{field}") || 0)
        end
      end
    end
  end
end
