require 'rails_helper'

describe 'user visits user show' do
  it 'has profile info' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    url1 = "https://api.github.com/users/#{user.username}?access_token=#{user.oauthtoken}"
    profile_response = File.read('./fixtures/profile.json')
    stub_request(:get, url1).
           to_return(status: 200, body: profile_response)

    url2 = "https://api.github.com/users/#{user.username}/repos?access_token=#{user.oauthtoken}"
    repo_response = File.open('./fixtures/repos.json')
    stub_request(:get, url2).to_return(status: 200, body: repo_response)

    visit user_path(user)

    expect(page).to have_content("I am a backend engineering student")
    expect(page).to have_content("apicurious")
    expect(page).to have_content("A site for all curriculum and day to day")
  end
end
