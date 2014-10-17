require 'rails'
require 'ripped_params/controller_initializer'

module RippedParams
  class Railtie < Rails::Railtie
    initializer "mega_lotto.action_view" do
      ActiveSupport.on_load(:action_controller) do
        include RippedParams::ControllerInitializer
      end
    end
  end
end
