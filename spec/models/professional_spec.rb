require 'rails_helper'

describe Professional do
  it "has valid factory" do
    expect(FactoryGirl.create(:professional)).to be_valid
  end

  it "is invalid without name" do
    expect(FactoryGirl.build(:professional, name: nil).valid?).to equal(false)
  end

  it "is invalid without CEP" do
    expect(FactoryGirl.build(:professional, cep: nil).valid?).to equal(false)
  end

  it "is invalid without CPF" do
    expect(FactoryGirl.build(:professional, cpf: nil)).to_not be_valid
  end

  it "is invalid without complement" do
    expect(FactoryGirl.build(:professional, complement: nil)).to_not be_valid
  end

  it "is invalid for invalid CEP format" do
    expect(FactoryGirl.build(:professional, cep: "string").valid?).to equal(false)
    expect(FactoryGirl.build(:professional, cep: "123-0989").valid?).to equal(false)
  end

  it "is invalid for invalid CPF format" do
    expect(FactoryGirl.build(:professional, cpf: "string")).to_not be_valid
    expect(FactoryGirl.build(:professional, cpf: "124.206.717-59")).to be_valid
  end

end
