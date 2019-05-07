# frozen_string_literal: true

FactoryBot.define do
  factory :friend do
    
  end

  factory :group do
    
  end

  factory :user_group do
    
  end

  factory :user, aliases: %i[director executor] do
    name { 'Joe' }
    email { 'joe@gmail.com' }
    password { 'qqqqqqq' }
  end

  factory :task do
    director
    executor

    title { 'Title' }
    date_task { DateTime.now }
  end
end
