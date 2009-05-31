# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{disguise}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Ball"]
  s.date = %q{2009-05-30}
  s.description = %q{Add themes to your Rails application to easily change the view layer and impress everyone you know}
  s.email = %q{justinball@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/admin/disguise/themes_controller.rb",
     "app/models/theme.rb",
     "app/views/admin/themes/_theme.html.erb",
     "app/views/admin/themes/edit.html.erb",
     "config/disguise_routes.rb",
     "db/migrate/20090530170040_create_themes.rb",
     "generators/theme/USAGE",
     "generators/theme/templates/INSTALL",
     "generators/theme/templates/description.txt",
     "generators/theme/templates/locale/en.yml",
     "generators/theme/templates/preview.gif",
     "generators/theme/templates/stylesheets/styles.css",
     "generators/theme/templates/views/_footer.html.erb",
     "generators/theme/templates/views/_head.html.erb",
     "generators/theme/templates/views/_header.html.erb",
     "generators/theme/templates/views/application.html.erb",
     "generators/theme/templates/views/home.html.erb",
     "generators/theme/theme_generator.rb",
     "lib/action_controller/disguise_application.rb",
     "lib/disguise.rb",
     "lib/disguise.rb",
     "lib/disguise/initialize_routes.rb",
     "lib/disguise/tasks.rb",
     "locales/en.yml",
     "rails/init.rb",
     "tasks/rails.rake",
     "test/disguise_test.rb",
     "test/disguise_test.rb",
     "test/test_helper.rb",
     "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jbasdf/disguise}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{disguise}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Easy to use view theme system for Rails}
  s.test_files = [
    "test/disguise_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
