require 'test_helper'

class DomainThemeTest < ActiveSupport::TestCase

  context "theme" do
    setup do
      @domain_theme = Factory(:domain_theme)
    end
    should_validate_presence_of :name, :uri
  end

  context "theme by request" do
    setup do
      @valid_uri = 'green.example.com'
      @invalid_uri = 'red.example.com'
      @request = mock()
      @domain_theme = Factory(:domain_theme, :name => 'green', :uri => @valid_uri)
    end

    context "valid url" do
      setup do
        @request.stubs(:host).returns(@valid_uri)
      end
      should "find the green theme" do
        assert_equal 'green', DomainTheme.get_theme(@request).name
      end
      should "find the green domain theme" do
        assert_equal @domain_theme, DomainTheme.get_domain_theme(@request)
      end
    end
    
    context "invalid url" do
      setup do
        @request.stubs(:host).returns(@invalid_uri)
      end
      should "not find the theme" do
        assert_nil DomainTheme.get_theme(@request)
      end
      should "not find the domain theme" do
        assert_not_equal @domain_theme, DomainTheme.get_domain_theme(@request)
      end
    end
  end
  
end