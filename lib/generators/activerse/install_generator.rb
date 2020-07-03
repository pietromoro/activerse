require 'rails/generators/base'
require 'securerandom'

module Activerse
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates an activerse initializer and copy setup file to your application, optionally resetting master key"

      def copy_initializer
        template "activerse.rb", "config/initializers/devise.rb"
      end
    end
  end
end
