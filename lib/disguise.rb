require 'disguise/config'

ActionController::Base.send :include, ActionController::DisguiseApplication

I18n.load_path += Dir[ File.join(File.dirname(__FILE__), '..', 'locales', '*.{rb,yml}') ]

# Set defaults
Disguise::Config.themes_enabled = true
Disguise::Config.use_domain_for_themes = false
Disguise::Config.theme_path = 'themes'
Disguise::Config.theme_full_base_path = File.join(RAILS_ROOT, Disguise::Config.theme_path)

module Disguise
  class Railtie < Rails::Railtie

    railtie_name :disguise
    config.disguise.themes_enabled = true
    config.disguise.use_domain_for_themes = false
    config.disguise.theme_path = 'themes'
    config.disguise.theme_full_base_path = File.join(root, config.theme_path)

    rake_tasks do
      load "disguise/tasks.rb"
    end
  
    initializer "disguise.setup" do |app|
      %w(themes_enabled use_domain_for_themes theme_path theme_full_base_path).each do |attr|
        ActionController.base_hook do
          self.send("#{attr}=", app.config.disguise[attr])
        end
      end
    end

  end
end

class MyApp::Application < Rails::Application
  config.disguise.use_domain_for_themes = true
end