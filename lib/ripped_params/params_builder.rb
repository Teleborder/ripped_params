require 'find'

class NoYAMLFileFoundError < Exception; end

module RippedParams
  class ParamsBuilder
    def initialize(params, name)
      @params = params
      @name = name
    end

    def build
      @params.require(params_data[:require]).permit(params_data[:permit])
    end

    private
      def params_data
        @params_data ||= begin
          raise NoYAMLFileFoundError, "Could not find #{params_yaml_file_name} in #{yaml_files_directory} directory" if !params_yaml_file_path
          YAML.load_file(params_yaml_file_path)
        end
      end

      def params_yaml_file_path
        @params_yaml_file_path ||= Find.find(yaml_files_directory).find do |file_path|
          Pathname.new(file_path).basename.to_path == params_yaml_file_name
        end
      end

      def yaml_files_directory
        "#{Rails.root}/lib/ripped_params"
      end

      def params_yaml_file_name
        "#{@name}.yml"
      end
  end
end
