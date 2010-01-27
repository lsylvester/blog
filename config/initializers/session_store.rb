# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_blog_session',
  :secret => '96157dd045d8112ad1f2efbf0a5d7a7b7e2206b6934fa2ec77dbe2481d1853bbd3c40fdb452286f89777d9efc38ba3f652cc714795438119d896ff84d06d023f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
