class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if user
      log_in(user)
      redirect_to subs_url
    else
      flash[:errors] = ["Invalid Username/Password"]
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end


end
