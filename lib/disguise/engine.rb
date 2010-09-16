require 'disguise'
require 'rails'

module Disguise
  class Engine < ::Rails::Engine
    
    def muck_name
      'disguise'
    end
      
    initializer 'disguise.disguise_application' do |app|
      ActiveSupport.on_load(:action_controller) do
        include ActionController::DisguiseApplication
      end
    end
    
  end
end
