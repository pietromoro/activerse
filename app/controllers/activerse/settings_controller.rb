require_dependency "activerse/application_controller"

module Activerse
  class SettingsController < ApplicationController
    before_action :set_setting, only: [:show, :edit, :update, :destroy]

    def index
      @settings = Setting.all
    end

    def show
    end

    def new
      @setting = Setting.new
    end

    def create
      @setting = Setting.new(setting_params)

      if @setting.save
        redirect_to @setting, notice: 'Setting was successfully created.'
      else
        render :new
      end
    end

  private
    def set_setting
      @setting = Setting.find(params[:id])
    end

    def setting_params
      params.require(:setting).permit(:key, :value)
    end
  end
end
