module ActionController
  module DisguiseApplication
    
    extend ActiveSupport::Concern
    
    included do
      before_filter :setup_theme
      helper_method current_theme
    end

    module ClassMethods
      
      # In you class call:
      # def ApplicationController
      #   set_theme_path "/somepath"
      # end
      def set_theme_path(path = nil, &block)
        self.theme_path = block || lambda { path }
      end
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
        path = instance_eval(&theme_path)

        return if !themes_enabled
        return if current_theme.blank? || current_theme.name.blank?
        theme_view_path = File.join(theme_full_base_path, current_theme.name, 'views')
        # In Rails 3:
        # FileSystemResolver.new
        # theme_view_path = File.join(Disguise.configuration.theme_full_base_path, current_theme.name, 'views')
        if self.view_paths.first == theme_view_path
          return
        else
          return if !theme_exists(theme_view_path)
          clean_theme_view_path
          self.prepend_view_path(theme_view_path)
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
        self.view_paths.delete_if {|view_path| view_path.to_s.index(theme_path) == 0}
      end

      def clean_theme_locale
        I18n.load_path.delete_if {|localization_path| localization_path.index(theme_full_base_path) == 0}
      end

      def set_theme_locale
        I18n.load_path += current_theme.locales
      end
    
  end
end