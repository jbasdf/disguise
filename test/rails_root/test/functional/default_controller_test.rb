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
      @theme = Theme.first || Theme.create
      @theme.current = 'blue'
      @theme.save!
    end
    
    should "not add more than one item to the view path" do
    end
    
    should "not add extra locales to the " do
    end
  
    context "render the blue theme home page" do
      setup do
        get :index
      end
      should_respond_with :success
      should_render_template '/themes/blue/views/default/index'
    end

  end

end