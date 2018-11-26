class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :destroy, :change_password, :update_password]
  before_action :check_admin, except: [:show, :index, :change_password, :update_password]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @tenant = @member.tenant
  end

  # GET /members/new
  def new
    @member = Member.new
    @tenant = @member.tenant || @member.build_tenant
  end

  # GET /members/1/edit
  def edit
    @tenant = @member.tenant || @member.build_tenant
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member profile successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @tenant = @member.tenant || @member.build_tenant
    respond_to do |format|
      if @member.update(member_params)
        @member.tenant = nil unless @member.rented?
        format.html { redirect_to @member, notice: "#{current_member == @member ? 'Your' : 'Member'} profile successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member profile successfully removed.' }
      format.json { head :no_content }
    end
  end

  def change_password
  end

  def update_password
    respond_to do |format|
      if @member.update_with_password(member_params)
        bypass_sign_in @member
        format.html { redirect_to @member, notice: 'Password successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :change_password }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def check_admin
      unless current_member.admin? or current_member == @member
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :block, :floor, :flat, :owner, :active, :rented, :email, :sec_email, :phone, :sec_phone, :password, :password_confirmation, :current_password, tenant_attributes: [:name, :email, :phone])
    end
end
