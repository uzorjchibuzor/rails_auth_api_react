# frozen_string_literal: true

# spec/controllers/static_controller.spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  include ApiHelpers

  describe '#create' do
    context 'with a valid user params' do
      let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }
      it 'gets a successful response' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(response.status).to eq(200)
      end

      it 'gets a response containing created user email' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(json["user"]["email"]).to eq(new_user.email)
      end

      it 'logs the user in' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(json["logged_in"]).to be true
      end
    end

    context 'with a invalid user params' do
      let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }
      it 'gets a status 401 response' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjkl' } }
        expect(json).to eq({"status"=>401})
      end
    end
  end
end
