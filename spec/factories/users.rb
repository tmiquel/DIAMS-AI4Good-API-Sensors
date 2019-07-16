FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      email { 'foo@bar.com' }
      password { 'foobar' }
      password_confirmation { 'foobar' }
    end
  end