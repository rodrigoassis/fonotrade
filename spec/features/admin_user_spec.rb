require 'rails_helper'

describe "the user process" do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "redirects me to sign in" do
    visit "admin"

    expect(current_path).to eq("/users/sign_in")
  end

  it "signs me in" do
    visit "/admin"
    fill_in 'Email', with: @user.email
    fill_in 'Senha', with: @user.password

    click_button 'Entrar'
    expect(page).to have_content 'sucesso'
  end

  it "dont' allow unauthorized access" do
    visit new_path(model_name: 'user')

    expect(page).to have_content 'Para continuar, efetue login'
  end

  it "has correct index columns" do
    login_as(@user, scope: :user)
    visit index_path(model_name: 'user')

    expect(page).to have_content 'Email'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'Login atual'
    expect(page).to have_content 'Número de logins'
  end

  it "has correct fields" do
    login_as(@user, scope: :user)
    visit new_path(model_name: 'user')

    expect(page).to have_content 'Email'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'Senha'
    expect(page).to have_content 'Confirmação de Senha'
  end

  it "can create a user" do
    login_as(@user, scope: :user)
    visit new_path(model_name: 'user')

    fill_in 'Nome', with: "Teste"
    fill_in 'Email', with: "teste@email.com"
    fill_in 'Senha', with: "senha"
    fill_in 'Confirmação de Senha', with: "senha"

    click_button 'Finalizar'
    expect(page).to have_content 'sucesso'
  end
end
