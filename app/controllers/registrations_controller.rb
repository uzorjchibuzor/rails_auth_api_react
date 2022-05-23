# frozen_string_literal: true

# Registrations creation controller class
class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
