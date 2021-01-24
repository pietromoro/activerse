require 'rails/generators/base'

module Activerse
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Initialize activerse (creates the initializer file)"

      def copy_templates
        template "activerse.rb", "config/initializers/activerse.rb"
      end

      def ensure_credentials_files
        key_path = Rails.application.config.credentials.key_path
        credentials_path = Rails.application.config.credentials.content_path
        encryption_key_file_generator.add_key_file(key_path) unless File.exists? key_path
        credentials_generator.add_credentials_file_silently unless File.exists? credentials_path
      end

      def update_git
        return unless Dir.exists? ".git"
        if File.exists? "config/credentials.enc.yml"
          git rm: "--cached config/credentials.enc.yml"
        end

        append_to_file ".gitignore", <<-GIT
        # Ignore credentials file (Activerse)
        config/master.key
        config/credentials.enc.yml
        GIT
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    
    private
      def encryption_key_file_generator
        require "rails/generators"
        require "rails/generators/rails/encryption_key_file/encryption_key_file_generator"

        Rails::Generators::EncryptionKeyFileGenerator.new
      end

      def credentials_generator
        require "rails/generators"
        require "rails/generators/rails/credentials/credentials_generator"

        Rails::Generators::CredentialsGenerator.new
      end
    end
  end
end
