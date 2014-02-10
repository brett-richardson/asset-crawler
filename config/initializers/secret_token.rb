# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
unsafe = '2f9ce4d4dbedf0bffc279f9a51fc69d722f050cc10f46208f870ca9be128be39cde2d4fc540dfaad71f68d5fb483fa1a22c126d0efd5132218fc61ccdfa1a111'

AssetCrawler::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
  unsafe
else
  ENV['SECRET_TOKEN']
end
