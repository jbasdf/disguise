class ThemeGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|

      # Theme directory
      m.directory "themes/#{file_name}"
      m.directory "themes/#{file_name}/locale"
      m.directory "themes/#{file_name}/views"
      m.directory "themes/#{file_name}/views/layouts"
      m.directory "themes/#{file_name}/views/layouts/global"

      # basic theme files
      m.file "views/_head.html.erb", "themes/#{file_name}/views/layouts/global/_head.html.erb"
      m.file "views/_header.html.erb", "themes/#{file_name}/views/layouts/global/_header.html.erb"
      m.file "views/_footer.html.erb", "themes/#{file_name}/views/layouts/global/_footer.html.erb"
      m.file "views/default.html.erb", "themes/#{file_name}/views/layouts/default.html.erb"

      # description
      m.file "description.txt", "themes/#{file_name}/description.txt"

      # images
      m.directory "public/images/#{file_name}"
      m.file "preview.gif", "public/images/#{file_name}/preview.gif"

      #stylesheets
      m.directory "public/stylesheets/themes"
      m.directory "public/stylesheets/themes/#{file_name}"
      m.file "stylesheets/styles.css", "public/stylesheets/#{file_name}.css"

      # localization
      m.directory "themes/#{file_name}/locales"
      m.file "locales/en.yml", "themes/#{file_name}/locales/en.yml"

      m.readme "INSTALL"
    end
  end

end



