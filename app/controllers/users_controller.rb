require_relative '../services/github'

class UsersController < ApplicationController
  def show
    gh = Github.new(current_user.oauthtoken)
    if (params[:id].to_i == current_user.id) || (params[:id] == current_user.username)
      name = current_user.username
      @is_current = true
    else
      name = params[:id]
      @is_current = false
    end
    @profile = gh.profile(name)
    @repos = gh.repositories(name).repositories
    # binding.pry
  end
end
