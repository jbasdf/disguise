module Disguise
  module Generators
    class ThemeGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates the folder structure for a new theme and copies over the appropriate files."

      def create_theme

          # Theme directory
          # m.directory "themes/#{file_name}"
          # m.directory "themes/#{file_name}/locale"
          # m.directory "themes/#{file_name}/views"
          # m.directory "themes/#{file_name}/views/layouts"
          # m.directory "themes/#{file_name}/views/layouts/global"

          # basic theme files        
          copy_file "views/_head.html.erb", "themes/#{file_name}/views/layouts/global/_head.html.erb"
          copy_file "views/_header.html.erb", "themes/#{file_name}/views/layouts/global/_header.html.erb"
          copy_file "views/_footer.html.erb", "themes/#{file_name}/views/layouts/global/_footer.html.erb"
          copy_file "views/default.html.erb", "themes/#{file_name}/views/layouts/default.html.erb"

          # description
          copy_file "description.txt", "themes/#{file_name}/description.txt"

          # images
          #m.directory "public/images/#{file_name}"
          copy_file "preview.gif", "public/images/#{file_name}/preview.gif"

          #stylesheets
          # m.directory "public/stylesheets/themes"
          #         m.directory "public/stylesheets/themes/#{file_name}"
          copy_file "stylesheets/styles.css", "public/stylesheets/#{file_name}.css"

          # localization
  #        m.directory "themes/#{file_name}/locales"
          copy_file "locales/en.yml", "themes/#{file_name}/locales/en.yml"

   #       m.readme "INSTALL"
      end
    end
  end
end