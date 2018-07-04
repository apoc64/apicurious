require 'rails_helper'

describe 'user visits user show' do
  it 'has repos' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Welcome #{user.username}")
    # Needs repos
  end
end
