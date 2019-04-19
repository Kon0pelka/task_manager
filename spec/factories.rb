# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Joe' }
    email { 'joe@gmail.com' }
    password { 'qqqqqqq' }
  end

  factory :task_user do
  end

  factory :task do
    user

    title { 'Title' }
    date_task { DateTime.now }
  end
end
