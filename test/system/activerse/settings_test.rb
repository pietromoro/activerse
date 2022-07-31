require "application_system_test_case"

module Activerse
  class SettingsTest < ApplicationSystemTestCase
    setup do
      @setting = activerse_settings(:one)
    end

    test "visiting the index" do
      visit settings_url
      assert_equal 200, page.status_code
    end
  end
end
