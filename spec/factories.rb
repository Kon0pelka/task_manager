# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Joe' }
    email { 'joe@gmail.com' }
    password { 'qqqqqqq' }
  end
end
