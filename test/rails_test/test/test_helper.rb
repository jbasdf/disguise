$:.reject! { |e| e.include? 'TextMate' }
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'

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
    controller.view_paths.delete_if {|view_path| view_path.to_path.index(Disguise.configuration.theme_full_base_path) == 0}
  end

  def clean_theme_locale
    I18n.load_path.delete_if {|localization_path| localization_path.index(Disguise.configuration.theme_full_base_path) == 0}
  end
  
end