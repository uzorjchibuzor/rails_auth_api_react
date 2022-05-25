# frozen_string_literal: true

# spec/requests/login_user_spec.rb

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  include ApiHelpers

  describe 'Sessions/create' do
    let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }

    context 'with valid parameters' do
      before do
        post '/sessions', params: { user: { email: new_user.email, password: 'asdfghjk' } }
      end
      it 'logs in an existing user' do
        expect(json['logged_in']).to be true
      end
    end

    context 'with invalid parameters' do
      before do
        post '/sessions', params: { user: { email: new_user.email, password: 'asdfghjkl' } }
      end
      it 'does not login a user' do
        expect(json).to eq({"status"=>401})
      end
    end
  end

  describe 'Sessions/logged_in' do
    let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }

    context 'if a user is already logged in' do
      before do
        post '/sessions', params: { user: { email: new_user.email, password: 'asdfghjk' } }
        get '/logged_in'
      end
      it 'returns details of the logged in user' do
        expect((json['user']['email'])).to eq(new_user.email)
        expect(json["logged_in"]).to eq(true)
      end
    end

    context 'if no user is logged in' do
      before do
        get '/logged_in'
      end
      it 'does not login a user' do
        expect(json).to eq({"logged_in"=>false})
      end
    end
  end

  describe 'Sessions/logout' do
    let(:new_user) { User.create(email: '123@abc.com', password: 'asdfghjk', password_confirmation: 'asdfghjk') }

    context 'if a user is logged in' do
      before do
        post '/sessions', params: { user: { email: new_user.email, password: 'asdfghjk' } }
        delete '/logout'

        # { status: 200, logged_out: true }
      end
      it 'returns success' do
        expect(json).to eq({ 'status'=> 200, "logged_out"=> true })
      end
    end

    context 'if no user is logged in' do
      before do
        delete '/logout'
      end
      it 'returns appropriate message to indicate no user is logged in' do
        eq({ 'status'=> 401, 'logged_in' => 'no user logged in' })
      end
    end
  end
end
