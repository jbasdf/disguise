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
  
end



