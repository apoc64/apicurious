require 'rails_helper'

describe 'visitor visits root' do
  it 'has a login link' do
    visit '/'
    expect(page).to have_link('Login with Github')
  end

  it 'can fail to login' do
    visit '/auth/github/callback'

    expect(current_path).to eq('/')
  end

  it 'can login with github' do
    stub_omniauth
    visit '/'
    click_link "Login with Github"

    expect(page).to have_content("Welcome")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      info: {
        nickname: 'bob'
      },
      credentials: {
        token: 'abc123'
      }
    })
  end
end
