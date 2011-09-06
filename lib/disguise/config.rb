# Configure disguise
#
module Disguise

  def self.configuration
    # In case the user doesn't setup a configure block we can always return default settings:
    @configuration ||= Configuration.new
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :themes_enabled
    attr_accessor :use_domain_for_themes
    attr_accessor :theme_full_base_path
    attr_accessor :locales_enabled

    def initialize
      @themes_enabled = true
      @locales_enabled = false
      @use_domain_for_themes = false      
      @theme_full_base_path = File.join(::Rails.root.to_s, 'themes')      
    end
  end
end
