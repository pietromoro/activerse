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

    def edit
    end

    def create
      @setting = Setting.new(setting_params)

      if @setting.save
        redirect_to @setting, notice: 'Setting was successfully created.'
      else
        render :new
      end
    end

    def update
      if @setting.update(setting_params)
        redirect_to @setting, notice: 'Setting was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @setting.destroy
      redirect_to settings_url, notice: 'Setting was successfully destroyed.'
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
