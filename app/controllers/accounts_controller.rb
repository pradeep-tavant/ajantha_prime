class AccountsController < ApplicationController
  before_action :authenticate_member!
  before_action :check_admin
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    filter = if params[:filter].blank?
      Date.today.strftime("%b-%Y")
    else
      params[:filter]
    end
    month, year = filter.split('-')
    @accounts = Account.where(for_month: filter).order(:sort)
    transactions = Transaction.where('extract(month from on_date) = ? AND extract(year from on_date) = ?', Date::ABBR_MONTHNAMES.index(month), year).Verified
    @maintenance_income = transactions.Maintenance.sum(&:amount_paid)
    @party_hall_income = transactions.PartyHall.sum(&:amount_paid)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def check_admin
      unless current_member.admin?
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:title, :amount, :account_type, :payment_mode, :on_date, :for_month, :description, :member_id, :invoice_id)
    end
end
