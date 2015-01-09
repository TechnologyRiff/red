require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
       
        v = Vote.new(value: 1)
          v.valid? #=> true

        v2 = Vote.new(value: -1)
          v2.valid? #=> true

        v3 = Vote.new(value: 2)
          v3.valid? #=> false
        end
      end
    end
  end