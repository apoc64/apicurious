class UsersController < ApplicationController
  def show
    user = current_user
    user_response = Faraday.get("https://api.github.com/users/#{user.username}?access_token=#{user.oauthtoken}")
    @profile = JSON.parse(user_response.body)
    repo_response = Faraday.get("https://api.github.com/users/#{user.username}/repos?access_token=#{user.oauthtoken}")
    @repos = JSON.parse(repo_response.body)
    # binding.pry

    # File.open("profile.json", 'w') { |f| f.puts repo_response.body }
  end
end
