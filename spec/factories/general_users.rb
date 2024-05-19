# spec/factories/general_users.rb
FactoryBot.define do
  factory :general_user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
