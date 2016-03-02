class WelcomeController < ApplicationController
  def start
  end

  def post_start
    redirect_to "/welcome/search"
  end

  def login

  end

  def post_login
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      neighborhood = Neighborhood.find(user.neighborhood_id)
      redirect_to neighborhoods_url(neighborhood)
    else
      redirect_to "/"
    end
  end

  def search
  end
end