# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :vkontakte,     ENV['VKONTAKTE_KEY'], ENV['VKONTAKTE_SECRET']
end
