ActionController::Base.send :include, ActionController::DisguiseApplication

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]

class Disguise
  
  class << self
    attr_accessor :themes_enabled
    attr_accessor :use_domain_for_themes
    attr_accessor :theme_path
    attr_accessor :theme_full_base_path
  end
  
end

# Set defaults
Disguise.themes_enabled = true
Disguise.use_domain_for_themes = false
Disguise.theme_path = 'themes'
Disguise.theme_full_base_path = File.join(RAILS_ROOT, Disguise.theme_path)
