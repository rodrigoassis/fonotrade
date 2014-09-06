require 'rails_helper'

describe User do
  it "has valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end

  it "is invalid without email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it "has unique email" do
    FactoryGirl.create(:user, email: 'abc@oib.com')
    expect(FactoryGirl.build(:user, email: 'abc@oib.com')).not_to be_valid
  end

  it "is invalid without password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end
end
