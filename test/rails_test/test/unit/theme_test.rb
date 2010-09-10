require 'test_helper'

class ThemeTest < ActiveSupport::TestCase

  context "theme" do
    setup do
      @theme = Theme.first || Theme.create
      @theme.name = 'blue'
      @blue_theme_hash = {:name => "blue", :description => "Put information about your theme here", :preview_image => "/images/blue/preview.gif"}
    end
    context "locales" do
      should "get the locales for the current theme" do
        assert @theme.locales.any? {|locale| locale.index('blue') > 0}, "locales for the blue theme did not contain blue.yml"
      end
    end
    context "available themes" do
      should "find 2 themes" do
        current_theme, themes = Theme.available_themes(@theme)
        assert themes.length == 2
        assert_equal @blue_theme_hash[:name], current_theme[:name]
        assert_equal @blue_theme_hash[:description], current_theme[:description]
        assert_equal @blue_theme_hash[:preview_image], current_theme[:preview_image]
      end
    end
  end

end