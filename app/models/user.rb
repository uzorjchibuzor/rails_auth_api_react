# frozen_string_literal: true

# User model class
class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
end
