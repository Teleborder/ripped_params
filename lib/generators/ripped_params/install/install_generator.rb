module RippedParams
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_yaml_templates
        template "project_params.yml", "lib/ripped_params/project/project_params.yml"
      end
    end
  end
end
