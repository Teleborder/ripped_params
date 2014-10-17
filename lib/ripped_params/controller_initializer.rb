require 'ripped_params/params_builder'

module RippedParams
  module ControllerInitializer
    class ActionController::Base

      def self.uses_ripped_params(*names)
        names.each do |name|
          define_method name.to_s do
            ParamsBuilder.new(params, name).build
          end
        end
      end
    end
  end
end
