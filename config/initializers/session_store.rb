# frozen_string_literal: true

Rails.application.config.session_store :cookie_store, key: '_authentication_app', domian: 'https://auth-app-api-rails-react.herokuapp.com/'
