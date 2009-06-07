$:.reject! { |e| e.include? 'TextMate' }
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

require 'test_help'
gem 'thoughtbot-factory_girl' # from github
require 'factory_girl'
require 'ruby-debug'
require 'mocha'
require 'redgreen' rescue LoadError
require File.expand_path(File.dirname(__FILE__) + '/factories')
class ActiveSupport::TestCase
    
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  
  def ensure_flash(val)
    assert_contains flash.values, val, ", Flash: #{flash.inspect}"
  end
  
  def setup_theme
    @theme = Theme.first || Theme.create
    @theme.name = 'blue'
    @theme.save!
  end
  
  def clean_theme_view_path(controller)
    controller.view_paths.delete_if {|view_path| view_path.to_s.index(Disguise::THEME_PATH) == 0}
  end

  def clean_theme_locale
    I18n.load_path.delete_if {|localization_path| localization_path.index(Disguise::THEME_FULL_BASE_PATH) == 0}
  end
  
end