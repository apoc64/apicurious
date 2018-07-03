class SessionsController < ApplicationController
  def create
    # binding.pry
    if params[:provider] == 'github'
      # auth_hash
      
    else
      flash[:notice] = "Please login with GitHub"
    end
  end

  # private
  #
  # def auth_hash
  #   binding.pry
  # end
end
