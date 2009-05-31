ActionController::Base.send :include, ActionController::DisguiseApplication

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]

module Disguise
  THEME_PATH = 'themes'
end