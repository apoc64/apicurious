class UsersController < ApplicationController
  def show
    # user = current_user
    # user_response = Faraday.get("https://api.github.com/users/#{user.username}?access_token=#{user.oauthtoken}")
    # @profile = JSON.parse(user_response.body)
    # repo_response = Faraday.get("https://api.github.com/users/#{user.username}/repos?access_token=#{user.oauthtoken}")
    # @repos = JSON.parse(repo_response.body)
    gh = Github.new(current_user.oauthtoken)
    if (params[:id] == current_user.id) || (params[:id] == current_user.username)
      name = current_user.usrname
      @is_current = true
    else
      name = params[:id]
      @is_current = false
    end
    @profile = gh.profile(name)
    @repos = gh.repositories(name)
  end
end
