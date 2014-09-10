require 'rails_helper'

describe Plan do
  it "has valid factory" do
    expect(FactoryGirl.create(:plan)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:plan, name: nil)).not_to be_valid
  end
end
