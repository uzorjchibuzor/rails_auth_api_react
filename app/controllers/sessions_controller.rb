# frozen_string_literal: true

# Sessions controller class
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { status: 401 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
