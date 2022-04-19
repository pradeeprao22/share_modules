FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "test-#{n.to_s.rjust(3, "0")}" }
      sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@londevs.com" }
      password { "123456" }
    end

    factory :post do
      content { "this is example" }
      password { "123456" }
    end
end