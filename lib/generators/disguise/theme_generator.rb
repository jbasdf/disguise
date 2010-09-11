#require 'rails/generators'

module Disguise
  module Generators
    class ThemeGenerator < Rails::Generators::NamedBase
      
      source_root File.expand_path("../theme_templates", __FILE__)
      desc "Creates the folder structure for a new theme and copies over the appropriate files."

      def create_theme
        # Basic theme files        
        copy_file "views/_head.html.erb", "themes/#{file_name}/views/layouts/global/_head.html.erb"
        copy_file "views/_header.html.erb", "themes/#{file_name}/views/layouts/global/_header.html.erb"
        copy_file "views/_footer.html.erb", "themes/#{file_name}/views/layouts/global/_footer.html.erb"
        copy_file "views/default.html.erb", "themes/#{file_name}/views/layouts/default.html.erb"

        # Theme description
        copy_file "description.txt", "themes/#{file_name}/description.txt"

        # Images
        copy_file "preview.gif", "public/images/#{file_name}/preview.gif"

        # Stylesheets
        copy_file "stylesheets/styles.css", "public/stylesheets/#{file_name}.css"

        # localization
        copy_file "locales/en.yml", "themes/#{file_name}/locales/en.yml"

        def show_readme
          readme "INSTALL"
        end
      end
    end
  end
end