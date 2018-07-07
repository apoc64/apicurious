class UsersController < ApplicationController
  def show
    @presenter = ProfilePresenter.new(params[:id], current_user)
  end
end
