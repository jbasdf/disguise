require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ThemesControllerTest < ActionController::TestCase

  def setup
    @controller = Admin::ThemesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  context "get edit page - no themes" do
    setup do
      @themes = mock()
      @current_theme = mock()
      @themes.stubs(:empty?).returns(true)
      Theme.stubs(:available_themes).returns([@current_theme, @themes])
      get :edit
    end
    should_respond_with :success
    should_render_template 'admin/themes/no_themes'
  end

  context "get edit page" do
    setup do
      get :edit
    end
    should_respond_with :success
    should_render_template 'admin/themes/edit'
  end
  
  context "update the current theme" do
    setup do
      setup_theme
      put :update, :theme => { :name => 'red' }
    end
    should "change the current theme" do
      assert_equal Theme.first.name, 'red'
    end
    should_set_the_flash_to(I18n.t("disguise.theme_updated"))
    should_redirect_to("edit theme") { edit_admin_theme_path }
  end
end