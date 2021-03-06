class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      @error_auth = "* Invalid Login or Password"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end