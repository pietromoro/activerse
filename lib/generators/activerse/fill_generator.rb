require 'rails/generators/base'

module Activerse
  module Generators
    class FillGenerator < ::Rails::Generators::Base
      desc "Fill out the credentials file and run startup code"

      def fill_out
        current_credentials = YAML.load(Rails.application.credentials.read)
        current_credentials.symbolize_keys!
        dsl = Activerse::Dsl.new(current_credentials)
        dsl.instance_eval(&Activerse::Configs.internal_structure)
        Rails.application.credentials.write YAML.dump(dsl.instance_eval("@credentials"))
      end
    end
  end
end