shared_examples_for ActsAsPercentage do |fields|
  fields.each do |field|
    describe "the #{field}" do
      describe "the #{field}_percentage getter" do
        it "convert the decmial to a human readable percentage" do
          expect(precentable.credit_card_rate_percentage).to eq(1.2)
        end

        it "should not fail if the credit_card_rate is empty" do
          precentable.credit_card_rate = nil
          expect(precentable.credit_card_rate_percentage).to eq(0)
        end
      end

      describe "the credit_card_rate_percentage setter" do
        describe 'with expected parameters' do
          it "should convert the human readable percentage value into a decimal for the db" do
            precentable.credit_card_rate_percentage = '27'
            expect(precentable.credit_card_rate).to eq(0.27)
          end

          it "should convert nil as 0.0" do
            precentable.credit_card_rate_percentage = nil
            expect(precentable.credit_card_rate).to eq(0.0)
          end
        end

        describe 'with weird parameters' do
          it "should ignore the %" do
            precentable.credit_card_rate_percentage = '203%'
            expect(precentable.credit_card_rate).to eq(2.03)
          end

          it "should not panic with bad input." do
            precentable.credit_card_rate_percentage = 'cookies dude.'
            expect(precentable.credit_card_rate).to eq(0.0)
          end
        end
      end
    end
  end
end
