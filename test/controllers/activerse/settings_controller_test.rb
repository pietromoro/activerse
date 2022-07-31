require "test_helper"

module Activerse
  class SettingsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @setting = activerse_settings(:one)
    end
    
  end
end
