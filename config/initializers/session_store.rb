# Be sure to restart your server when you modify this file.

configuration = { key: '_urkel_session', expire_after: 1.day }
Urkel::Application.config.session_store ActionDispatch::Session::CacheStore, configuration
