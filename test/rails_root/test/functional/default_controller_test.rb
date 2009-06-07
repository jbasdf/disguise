require File.dirname(__FILE__) + '/../test_helper'

class DefaultControllerTest < ActionController::TestCase

  def setup
    @controller = DefaultController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context "get home page" do
    setup do
      get :index
    end
    should_respond_with :success
    should_render_template :index # rendering the default home page
  end

  context "requests" do
    setup do
      setup_theme
      get :index
    end
    
    should "not add more than one item to the view path" do
      assert @controller.view_paths.length == 3
    end
    
    context "second request" do
      setup do
        clean_theme_view_path(@controller)
        get :index
      end
      should "not add any more items to the viewpath" do
        assert @controller.view_paths.length == 3
      end
    end
    
    should "have blue in the view path" do
      assert @controller.view_paths[0].to_s.include?('themes/blue/views'), "The blue theme should be first in the view paths but was #{@controller.view_paths[0]}"
    end

  end

  context "multiple requests" do
    setup do
      clean_theme_locale
      @default_locales_length = I18n.load_path.length
      @default_locales_length.freeze
      setup_theme
      get :index
      get :index
      get :index
    end
    should "not add extra locales" do
      assert_equal @default_locales_length + @theme.locales.length, I18n.load_path.length
    end
  end
  
  context "use url to determine theme" do
    setup do
      DomainTheme.stubs(:use_domain_themes?).returns(true)
      get :index
    end
  end
  
end