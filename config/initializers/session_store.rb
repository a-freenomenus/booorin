# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_booorin_session',
  :secret      => '5ff8022a1278c6e3f80ffb1412134406c98a45fa7400984f1011007d197bd17f7d7ffe61f17bf5ee3d0453664bd39a40020a0def89ade78700738e5f1b598c8a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
