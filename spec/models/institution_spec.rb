require 'rails_helper'

RSpec.describe Institution, :type => :model do
  it "has valid factory" do
    expect(FactoryGirl.create(:institution)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:institution, name: nil)).not_to be_valid
  end

  it "is invalid without unique name" do
    expect(FactoryGirl.create(:institution, name: 'Unique')).to be_valid
    expect(FactoryGirl.build(:institution, name: 'Unique')).to_not be_valid
  end
end
