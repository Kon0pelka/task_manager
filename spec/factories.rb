# frozen_string_literal: true

FactoryBot.define do
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
