module ActionController
  module DisguiseApplication
    
    # Module automatically mixed into the all controllers
    def self.included(base)
      base.class_eval do
        include InstanceMethods
        before_filter :setup_theme
      end
      base.send :helper_method, :current_theme
    end
    
    module InstanceMethods
      
      def current_theme
        return nil if Theme.first.blank?
        Theme.first.current
      end
      
      protected
      
      def setup_theme
        theme = current_theme
        return if theme.blank?
        self.prepend_view_path(File.join(RAILS_ROOT, 'themes', theme, 'views'))
        i18n_path = File.join(RAILS_ROOT, 'themes', theme, 'locale', "#{I18n.locale}.yml")
        if I18n.load_path.last != i18n_path
          I18n.load_path.delete_if {|localization_path| localization_path.include?('themes')}
          I18n.load_path << i18n_path
          I18n.reload!
        end
      end
      
    end
    
  end
end
