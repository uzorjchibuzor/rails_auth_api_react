# frozen_string_literal: true

# Sessions controller class
class SessionsController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    return render json: { status: :created, logged_in: true, user: @current_user } if @current_user

    render json: { logged_in: false }
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
