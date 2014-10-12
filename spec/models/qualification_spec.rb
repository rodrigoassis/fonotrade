require 'rails_helper'

RSpec.describe Qualification, :type => :model do
  it "has valid factory" do
    expect(FactoryGirl.create(:qualification)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:qualification, name: nil)).not_to be_valid
  end

  it "is invalid without unique name" do
    expect(FactoryGirl.create(:qualification, name: 'Unique')).to be_valid
    expect(FactoryGirl.build(:qualification, name: 'Unique')).to_not be_valid
  end
end
