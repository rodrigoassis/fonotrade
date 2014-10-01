require 'rails_helper'

RSpec.describe Course, :type => :model do
  it "has valid factory" do
    expect(FactoryGirl.create(:course)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:course, name: nil)).not_to be_valid
  end

  it "is invalid without institution" do
    expect(FactoryGirl.build(:course, institution: nil)).not_to be_valid
  end
end
