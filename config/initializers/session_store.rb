# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rbdatatube_session',
  :secret      => 'f66a2b7c21b08c58591c35df111eee36f8c1aadbf347f2e34b15791e3036f0b7cc9f47f136aba5c5604258a82e38ce380a72f9c4030b8af1f51c75fbee00508e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
