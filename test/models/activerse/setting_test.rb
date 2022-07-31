require "test_helper"

module Activerse
  class SettingTest < ActiveSupport::TestCase
    test "key is required" do
      setting = Setting.new
      assert_not setting.valid?
      assert_equal ["can't be blank"], setting.errors[:key]
    end

    test "value is required" do
      setting = Setting.new
      assert_not setting.valid?
      assert_equal ["can't be blank"], setting.errors[:value]
    end

    test "key is unique" do
      setting = Setting.new(key: "key", value: "value")
      assert setting.valid?
      setting.save
      setting2 = Setting.new(key: "key", value: "value")
      assert_not setting2.valid?
      assert_equal ["has already been taken"], setting2.errors[:key]
    end
  end
end
