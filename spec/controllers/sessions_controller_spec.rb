# frozen_string_literal: true

# spec/controllers/static_controller.spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do
    skip context 'with a valid user params' do
      let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }
      it 'gets a successful response' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(response).to be_successful
      end

      it 'gets a response containing created user email' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(response.body.gsub!(/"/, '\'')).to include(new_user.email)
      end

      it 'logs the user in' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjk' } }
        expect(response.body.gsub!(/"/, '\'')).to include('status', 'created')
      end
    end

    context 'with a invalid user params' do
      let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }
      it 'gets a status 401 response' do
        post :create, params: { user: { email: new_user.email, password: 'asdfghjkl' } }
        expect(response.body.gsub!(/"/, '\'')).to eq("{'status':401}")
      end
    end
  end
end
