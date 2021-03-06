# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://uzor-react-auth.herokuapp.com'
    resource '*', headers: :any, methods: %i[get post patch put delete options head], credentials: true
  end
end
