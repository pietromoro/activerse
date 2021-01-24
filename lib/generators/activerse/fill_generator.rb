require 'rails/generators/base'

module Activerse
  module Generators
    class FillGenerator < ::Rails::Generators::Base
      desc "Fill out the credentials file and run startup code"

      def fill_out
        dsl = Activerse::Dsl.new
        dsl.instance_eval(&Activerse::Configs.internal_structure)
      end
    end
  end
end