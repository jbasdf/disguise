module Disguise
  class Config
  
    class << self
      attr_accessor :themes_enabled
      attr_accessor :use_domain_for_themes
      attr_accessor :theme_path
      attr_accessor :theme_full_base_path
    end

  end
  
end