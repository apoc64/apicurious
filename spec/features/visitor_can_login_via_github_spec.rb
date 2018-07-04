require 'rails_helper'

describe 'visitor visits root' do
  it 'has a login link' do
    visit '/'
    expect(page).to have_link('Login with Github')
  end

  it 'can fail to login' do
    puts "Should display login failure message in console:"
    visit '/auth/github/callback'

    expect(current_path).to eq('/')
  end

  it 'can login with github' do
    stub_omniauth
    visit '/'
    click_link "Login with Github"

    expect(page).to have_content("Welcome apoc64")
  end
end
