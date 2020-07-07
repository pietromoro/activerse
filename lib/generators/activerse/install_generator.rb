require 'rails/generators/base'
require 'securerandom'

module Activerse
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an activerse initializer in your application configs directory"

      def copy_templates
        template "activerse.rb", "config/initializers/activerse.rb"
        template "structure.yml", "config/activerse_structure.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
