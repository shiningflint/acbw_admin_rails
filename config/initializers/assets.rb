# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( posts.css )
Rails.application.config.assets.precompile += %w( posts.js )
Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( categories.js )
Rails.application.config.assets.precompile += %w( settings.css )
Rails.application.config.assets.precompile += %w( settings.js )
Rails.application.config.assets.precompile += %w( sessions.css )
Rails.application.config.assets.precompile += %w( sessions.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
