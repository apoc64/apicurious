require 'rails_helper'

describe 'user visits root' do
  it 'has a login link' do
    visit '/'

    click_link 'Login with Github'

    expect(current_path).to include('https://github.com/login/oauth/authorize?')
  end
end
