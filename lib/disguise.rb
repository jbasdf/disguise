ActionController::Base.send :include, ActionController::DisguiseApplication

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]

module Disguise
  THEME_PATH = 'themes'
  THEME_FULL_BASE_PATH = File.join(RAILS_ROOT, THEME_PATH)
  USE_DOMAIN_FOR_THEMES = false
end