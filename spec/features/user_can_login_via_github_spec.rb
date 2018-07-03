require 'rails_helper'

describe 'user visits root' do
  it 'has a login link' do
    visit '/'
    expect(page).to have_link('Login with Github')
  end

  # it 'can fail to login' do
  #   visit '/auth/github/callback'
  #
  #   expect(page).to have_content("Failed to login via github")
  # end
end
