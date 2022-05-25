# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'john@doe.com' }
    password_digest { 'asdfghjk' }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
