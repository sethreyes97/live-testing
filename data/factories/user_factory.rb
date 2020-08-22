# frozen_string_literal: true

# Users factory
class User
  attr_accessor :email, :password, :country
end

FactoryBot.define do
  factory :user do
      email { 'test' }
      password { '123' }
      country { 'Canadá' }
  end
  skip_create
end
