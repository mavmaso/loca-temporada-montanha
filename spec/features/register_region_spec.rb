require 'rails_helper'

feature 'Register Region' do
  scenario 'successfully' do

    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    click_on 'Cadastrar região'
    fill_in 'Nome', with: 'Copacabana'
    click_on 'Cadastrar'

    expect(page).to have_css('p', text: 'Região cadastrada com sucesso')
    expect(page).to have_css('h1', text: 'Copacabana')
  end

  scenario 'and leave blank fields' do

    realtor = Realtor.create!(name: 'Éduardo Koch', email: 'kochs@01.com', password: '123456')

    visit root_path
    click_on 'Entrar como Corretor'
    fill_in 'Email', with: 'kochs@01.com' 
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    click_on 'Cadastrar região'
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve preencher todos os campos')
    expect(page).to have_content('Name não pode ficar em branco')
  end
end
