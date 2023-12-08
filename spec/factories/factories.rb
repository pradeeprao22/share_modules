FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test-#{n.to_s.rjust(3, '0')}" }
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@londevs.com" }
    bio { 'Example Bio' }
    password { '123456' }
    confirmed_at { Date.today }
  end

  factory :post do
    content { 'this is example' }
    frontend { '<html><titel>This is example</title><body><p>This is example</p></body></html>' }
    frontend_css { '.p { color: black }' }
    javascript { '<script></script>' }
    instruction { 'This is instructions' }
    published { true }
    tags_id { %w[3 3 4] }
  end
end
