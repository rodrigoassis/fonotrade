require 'rails_helper'

describe Specialty do
  it "has valid factory" do
    expect(FactoryGirl.create(:specialty)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:specialty, name: nil)).not_to be_valid
  end
end
