require "spec_helper"
require "ripped_params/params_builder"
require 'action_controller'
require "byebug"

module RippedParams
  describe ParamsBuilder do
    describe "#build" do
      let(:simple_params) do
        ActionController::Parameters.new({
          project: {
            service_id: 12,
            name: "Some Project"
          }
        })
      end

      it "returns required param" do
        params_builder = RippedParams::ParamsBuilder.new(simple_params, "project_params")
        params_builder.stub(:yaml_files_directory).and_return("spec/fixtures/ripped_params")
        correct_params = {"name"=>"Some Project", "service_id"=>12}
        expect(correct_params).to eq(params_builder.build)
      end

      it "rejects params that are not included in the yaml file" do
        bad_params = ActionController::Parameters.new({
          project: {
            service_id: 12,
            name: "Some Project",
            wrong_key: "Should not show up"
          }
        })
        params_builder = RippedParams::ParamsBuilder.new(bad_params, "project_params")
        params_builder.stub(:yaml_files_directory).and_return("spec/fixtures/ripped_params")
        correct_params = {"name"=>"Some Project", "service_id"=>12}
        expect(correct_params).to eq(params_builder.build)
      end

      it "raises error when yaml file name is passes in that is not included in ripped_params directory" do
        params_builder = RippedParams::ParamsBuilder.new(simple_params, "not_project_params")
        params_builder.stub(:yaml_files_directory).and_return("spec/fixtures/ripped_params")
        expect{params_builder.build}.to raise_error(NoYAMLFileFoundError)
      end

      it "raises error when required param is not found in the incomming params" do
        params_builder = RippedParams::ParamsBuilder.new(simple_params, "no_required_params")
        params_builder.stub(:yaml_files_directory).and_return("spec/fixtures/ripped_params")
        expect{params_builder.build}.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
