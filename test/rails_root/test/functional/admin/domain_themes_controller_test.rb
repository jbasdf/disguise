require File.dirname(__FILE__) + '/../../test_helper'

class Admin::DomainThemesControllerTest < ActionController::TestCase

  tests Admin::DomainThemesController
  
  def setup
    @new_uri = 'red.example.com'
  end
  
  context "create the domain theme" do
    setup do
      post :create, :domain_theme => { :name => 'red', :uri => @new_uri }
    end
    should_set_the_flash_to(I18n.t("disguise.theme_updated"))
    should_redirect_to("edit theme") { edit_admin_theme_path }
    should "create a new domain theme" do
      assert_difference 'DomainTheme.count' do
        post :create, :domain_theme => { :name => 'red_too', :uri => 'red_too_unique.example.com' }
      end
    end
  end
  
  context "update the domain theme" do
    setup do
      @domain_theme = Factory(:domain_theme, :name => 'red')
      put :update, :domain_theme => { :name => 'red', :uri => @new_uri }
      @domain_theme.reload
    end
    should "change the domain theme uri" do
      assert_equal @domain_theme.uri, @new_uri
    end
    should_set_the_flash_to(I18n.t("disguise.theme_updated"))
    should_redirect_to("edit theme") { edit_admin_theme_path }
  end
  
  context "DELETE to destroy" do
    setup do
      @domain_theme = Factory(:domain_theme)
      delete :destroy, :id => @domain_theme.to_param
    end
    should_set_the_flash_to(I18n.t('disguise.uri_deleted'))
    should_redirect_to("admin edit theme") { edit_admin_theme_path }
  end
  
  
end