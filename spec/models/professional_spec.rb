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

  it "is invalid for invalid CEP format" do
    expect(FactoryGirl.build(:professional, cep: "string").valid?).to equal(false)
    expect(FactoryGirl.build(:professional, cep: "123-0989").valid?).to equal(false)
  end

  it "can retrieve states" do
    professional = FactoryGirl.create(:professional)
    expect(professional.state_enum).to_not be_nil
    expect(professional.state_enum).to have_key :'Rio de Janeiro'
    expect(professional.state_enum).to have_key :'São Paulo'
    expect(professional.state_enum).to have_key :'Maranhão'
  end

  it "can retrieve cities" do
    professional = FactoryGirl.create(:professional)
    expect(professional.city_enum).to_not be_nil
    expect(professional.city_enum).to have_key :'Rio de Janeiro'
    expect(professional.city_enum).to have_key :'Niterói'
    expect(professional.city_enum).to have_key :'São João de Meriti'
  end

end
