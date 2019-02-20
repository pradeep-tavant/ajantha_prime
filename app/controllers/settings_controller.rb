class SettingsController < ApplicationController
  before_action :authenticate_member!
  before_action :check_admin
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  def index
    @settings = Setting.all
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to settings_path, notice: 'Setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to settings_path, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /settings/1
  def destroy
    @setting.destroy
      redirect_to settings_url, notice: 'Setting was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    def check_admin
      unless current_member.admin?
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:name, :value)
    end
end
