require 'rails_helper'

describe Vote do
  describe "validations" do

      before do
        @vote = Vote.create(value: 'vote value')
        3.times { @vote.create(value: 1) }
        2.times { @vote.create(value: -1) }
      end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect ( @vote ).to eq(1) || expect( @vote ).to eq(-1)
      end
    end
  end
end


# expect().to eq() 
# v = Vote.new(value: 1)
# v.valid? #=> true

# v2 = Vote.new(value: -1)
# v2.valid? #=> true

# v3 = Vote.new(value: 2)
# v3.valid? #=> false
