# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hashvid_session',
  :secret      => '84f415efcf90b7904c2fde169ee4d6a97153e3d85267edad559bf7b53790185102432e17b9373e758a9e3cfbc7765331f7f3f3bd93fa3fef669095f9b7e4875a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
