# frozen_string_literal: true

FactoryBot.define do
  factory :task_user do
    
  end

  factory :task do
    
  end
  factory :user do
    name { 'Joe' }
    email { 'joe@gmail.com' }
    password { 'qqqqqqq' }
  end
end
