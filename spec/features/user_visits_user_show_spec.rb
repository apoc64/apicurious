require 'rails_helper'

describe 'user visits user show' do
  it 'has profile info for current and other user' do
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
    expect(page).to have_link("Edit bio")

    url3 = "https://api.github.com/users/other_user?access_token=#{user.oauthtoken}"
    profile2_response = File.read('./fixtures/profile2.json')
    stub_request(:get, url3).
           to_return(status: 200, body: profile2_response)

    url4 = "https://api.github.com/users/other_user/repos?access_token=#{user.oauthtoken}"
    repo2_response = File.open('./fixtures/repos2.json')
    stub_request(:get, url4).to_return(status: 200, body: repo2_response)

    visit user_path("other_user")

    expect(page).to have_content("I am some other user")
    expect(page).to have_content("22lose_playlist")
    expect(page).to have_content("Some other repo")
    expect(page).to_not have_button("EDIT BIO")
  end
end
