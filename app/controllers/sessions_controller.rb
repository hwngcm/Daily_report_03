class SessionsController < ApplicationController
  def new; end

  def create
    params_session = params[:session]
    user = User.find_by email: params_session[:email].downcase
    if user && user.authenticate(params_session[:password])
      login user
    else
      render :new
      flash[:info] = t("login_unsuccess")
    end
  end

  def login user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_to user
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
