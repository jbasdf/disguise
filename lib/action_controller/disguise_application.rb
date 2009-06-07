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
        if DomainTheme.use_domain_themes?
          @theme ||= DomainTheme.get_theme(request)
        else
          @theme ||= Theme.first
        end
      end

      protected

      def setup_theme
        return if current_theme.blank? || current_theme.name.blank?
        theme_view_path = File.join(Disguise::THEME_FULL_BASE_PATH, current_theme.name, 'views')
        if self.view_paths.first == theme_view_path
          return
        else
          clean_theme_view_path
          self.prepend_view_path(theme_view_path)
          clean_theme_locale
          set_theme_locale
          I18n.reload!
        end
      end

      def clean_theme_view_path
        self.view_paths.delete_if {|view_path| view_path.to_s.index(Disguise::THEME_PATH) == 0}
      end

      def clean_theme_locale
        I18n.load_path.delete_if {|localization_path| localization_path.index(Disguise::THEME_FULL_BASE_PATH) == 0}
      end

      def set_theme_locale
        I18n.load_path += current_theme.locales
      end
      
    end
    
  end
end