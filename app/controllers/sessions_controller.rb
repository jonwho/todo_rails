class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to todos_path, flash: { success: "Welcome #{user.name}!" }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { info: "You have signed off" }
  end
end
