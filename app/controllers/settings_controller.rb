class SettingsController < ApplicationController
  before_action :authorize

  def edit
    @photo_base = Setting.find(params[:id])
  end

  def update
    @photo_base = Setting.find(params[:id])
    @photo_base.update(params.require(:setting).permit(:setting_name, :setting_value))
    redirect_to setting_path(@photo_base.id)
  end
end
