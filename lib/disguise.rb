require 'disguise/config'

ActionController::Base.send :include, ActionController::DisguiseApplication

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]

# Set defaults
Disguise::Config.themes_enabled = true
Disguise::Config.use_domain_for_themes = false
Disguise::Config.theme_path = 'themes'
Disguise::Config.theme_full_base_path = File.join(RAILS_ROOT, Disguise::Config.theme_path)
