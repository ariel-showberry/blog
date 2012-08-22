# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blog2_session',
  :secret      => '7fa44720478256861ec72ad9ec5e02abe52a059165425bb40fdb00012ade8a742cd7656b73de123646445fb8a4f884b7d3f66ceb8ef0bfa1670cc8c3a19dc470'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
