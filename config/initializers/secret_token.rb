# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# if Rails.env.development? or Rails.env.test?
  CityCenter::Application.config.secret_token = 'fcf52716cd46eeb2d527aef236fbb5942375786b3467787452c23a36149f690618caf9ec82b278a929bd136d2565896eb7b954b98a55e483b09bc37aca8b9f91'
# else
#   CityCenter::Application.config.secret_token = ENV['SECRET_TOKEN']
# end