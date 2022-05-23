# frozen_string_literal: true

# Checks whether there is a current user in session
module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    return @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
