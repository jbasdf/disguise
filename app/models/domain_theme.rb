class DomainTheme < ActiveRecord::Base
  
  validates_presence_of :name, :uri
  
  class << self
    def use_domain_themes?
      Disguise::USE_DOMAIN_FOR_THEMES
    end
  
    def get_theme(request)
      domain_theme = get_domain_theme(request)
      domain_theme.blank? ? nil : Theme.new(:name => domain_theme.name)
    end
    
    def get_domain_theme(request)
      self.find_by_uri(request.host)
    end
  end
  
end