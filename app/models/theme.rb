class Theme < ActiveRecord::Base

  def self.available_themes(theme)
    themes = []
    current_theme = {:name => 'default', :preview_image => '/images/no_preview.gif', :description => 'default theme'}
    theme_path = File.join(RAILS_ROOT, Disguise::THEME_PATH)

    Dir.glob("#{theme_path}/*").each do |theme_directory|
      if File.directory?(theme_directory)
        theme_name = File.basename(theme_directory)

        image = Dir.glob(File.join(RAILS_ROOT, 'public', 'images', theme_name, 'preview.*')).first || File.join('/', 'images', 'no_preview.gif')
        image = image.gsub(File.join(RAILS_ROOT, 'public'), '')

        description = ''
        description_file = File.join(theme_directory, 'description.txt')
        if File.exist?(description_file)
          f = File.new(description_file, "r")
          description = f.read
          f.close
        end

        theme = {:name => theme_name, :preview_image => image, :description => description}
        themes << theme

        current_theme = theme if theme.current == theme_name
      end
    end

    [current_theme, themes]
  end

end
