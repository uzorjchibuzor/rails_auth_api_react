# frozen_string_literal: true

# spec/controllers/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create a new user when presented with valid attributes' do
    expect(User.new(email: 'joe@doe.com',
                    password: '123456',
                    password_confirmation: '123456').save)
      .to be true
  end

  it 'does not create a new user when different passwords' do
    expect(User.new(email: 'joe@doe.com',
                    password: '123456',
                    password_confirmation: '1234567').save)
      .to be false
  end

  it 'does not create a new user without email' do
    expect(User.new(email: '',
                    password: '123456',
                    password_confirmation: '1234567').save)
      .to be false
  end

  it 'does not create a new user without email' do
    expect(User.new(email: '',
                    password: '123456',
                    password_confirmation: '1234567').save)
      .to be false
  end
end
