class UsersController < ApplicationController
  def show
    user = current_user
    response = Faraday.get("https://api.github.com/users/#{user.username}/repos?access_token=#{user.oauthtoken}")
    @repos = JSON.parse(response.body)
  end
end
