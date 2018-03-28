class UsersController < ApplicationController
  def destroy
    user = User.find(session[:user_id])

    if user.present? && user.destroy
      # flash[:success] = "Successfully deleted user #{user.email} and all user todos"
    else
      # flash[:error] = "Could not finish delete request try again later"
    end

    redirect_to root_path
  end
end
