# frozen_string_literal: true

# Users factory
class User
  attr_accessor :email, :password
end

FactoryBot.define do
  factory :user do
      email { Faker::Internet.email }
      password { 'Test1234' }
  end
  skip_create
end
