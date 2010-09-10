module ActionController
  module DisguiseApplication
    
    extend ActiveSupport::Concern
    
    included do
      before_filter :setup_theme
      helper_method :current_theme
    end

    module ClassMethods
    end

    def current_theme
      if DomainTheme.use_domain_themes?
        @theme ||= DomainTheme.get_theme(request)
      else
        @theme ||= Theme.first
      end
    end

    protected

      def setup_theme
        return if !Disguise.configuration.themes_enabled
        return if current_theme.blank? || current_theme.name.blank?
        theme_view_path = File.join(Disguise.configuration.theme_full_base_path, current_theme.name, 'views')
        if self.view_paths.first.to_path == theme_view_path
          return
        else
          return if !theme_exists(theme_view_path)
          clean_theme_view_path
          self.prepend_view_path(ActionView::FileSystemResolver.new(theme_view_path))
          clean_theme_locale
          set_theme_locale
          I18n.reload!
        end
      end

      def theme_exists(theme_view_path)
        @themes_exists ||= {}
        @themes_exists[theme_view_path] ||= File.exists?(theme_view_path)
      end
    
      def clean_theme_view_path
        self.view_paths.delete_if {|view_path| view_path.to_path.index(Disguise.configuration.theme_full_base_path) == 0}
      end

      def clean_theme_locale
        I18n.load_path.delete_if {|localization_path| localization_path.index(Disguise.configuration.theme_full_base_path) == 0}
      end

      def set_theme_locale
        I18n.load_path += current_theme.locales
      end
    
  end
end