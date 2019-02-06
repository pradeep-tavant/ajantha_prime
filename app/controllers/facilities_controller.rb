class FacilitiesController < ApplicationController
  before_action :authenticate_member!
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /facilities
  def index
    @facilities = current_member.admin? ? Facility.all : Facility.where(active: true)
  end

  # GET /facilities/1
  def show
    check_admin unless @facility.active?
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities
  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to @facility, notice: 'Facility was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(facility_params)
      redirect_to @facility, notice: 'Facility was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
    redirect_to facilities_url, notice: 'Facility was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    def check_admin
      unless current_member.admin?
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:name, :category_id, :designation, :phone, :email, :address, :shift, :active)
    end
end
