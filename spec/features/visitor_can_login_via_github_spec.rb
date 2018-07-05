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

  xit 'can login with github' do
    WebMock.allow_net_connect!
    stub_omniauth
    visit '/'

    # responses for Faraday??? - fails on @repos

    click_link "Login with Github"

    expect(page).to have_css(".profile")
    WebMock.disable_net_connect!
  end
end
