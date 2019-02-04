class TransactionsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :download_receipt]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_member.transactions
  end

  def all
    unless current_member.admin?
      flash[:error] = "You do not have access for this operation"
      redirect_to root_path
    else
      @transactions = Transaction.all
      render action: 'index'
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = current_member.transactions.build
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_receipt
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: "APOWA-Transaction-Receipt-#{@transaction.member.login}-#{Time.now.strftime('%v-%H:%M').to_s}",
        template: "transactions/download_receipt"
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
      check_admin
    end

    def check_admin
      unless current_member.admin? || current_member == @transaction.member
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:payment_mode, :transaction_id, :amount_paid, :on_date, :category, :description, :member_id, :status)
    end
end
