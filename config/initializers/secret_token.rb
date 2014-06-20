# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
ClientCommunication::Application.config.secret_key_base = 'a2f3089e983dfc5f85bf6be4c2781e854ec5a7bc7dcc689d29315f11754ea2dce74599618ea140b70ee9c9e3c9ddb2ca42641e1049bef17f6a1d449e9d50408f'
