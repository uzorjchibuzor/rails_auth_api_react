# frozen_string_literal: true

# Controller for home action
class StaticController < ApplicationController
  def home
    render json: { status: "It's Working" }
  end
end
