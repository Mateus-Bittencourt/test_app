FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
