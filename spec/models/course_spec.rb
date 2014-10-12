require 'rails_helper'

RSpec.describe Course, :type => :model do
  it "has valid factory" do
    expect(FactoryGirl.create(:course)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:course, name: nil)).not_to be_valid
  end

  it "is invalid without unique name" do
    expect(FactoryGirl.create(:course, name: 'Unique')).to be_valid
    expect(FactoryGirl.build(:course, name: 'Unique')).to_not be_valid
  end
end
