require 'rails_helper'

describe Plan do
  it "has valid factory" do
    expect(FactoryGirl.create(:experience)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:experience, name: nil)).not_to be_valid
  end

  it "is invalid without professional" do
    expect(FactoryGirl.build(:experience, professional: nil)).not_to be_valid
  end

  it "is invalid without institute" do
    expect(FactoryGirl.build(:experience, institute: nil)).not_to be_valid
  end

  it "is invalid without year" do
    expect(FactoryGirl.build(:experience, year: nil)).not_to be_valid
  end

  it "is invalid with year less than 1000" do
    expect(FactoryGirl.build(:experience, year: 999)).not_to be_valid
  end
end
