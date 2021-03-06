class TransactionsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :download_receipt, :verify_payment]

  # GET /transactions
  def index
    @transactions = current_member.transactions
  end

  def all
    unless current_member.admin?
      flash[:error] = "You do not have access for this operation"
      redirect_to root_path
    else
      category_hash = params[:category].blank? ? {} : {category: params[:category]}
      @transactions = if params[:filter] == 'pending' || params[:filter].blank?
        Transaction.where.not(status: 'Verified')
      elsif params[:filter] == 'verified'
        Transaction.where(status: 'Verified')
      else
        Transaction
      end.where(category_hash)
      render action: 'index'
    end
  end

  # GET /transactions/1
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
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      if @transaction.Verified?
        MemberMailer.with(transaction: @transaction).verify_payment.deliver_later
      end
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  def verify_payment
    if current_member.admin?
      @transaction.Verified!
      MemberMailer.with(transaction: @transaction).verify_payment.deliver_later
    end
    redirect_to all_transactions_path, notice: "Transaction was successfully verified."
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
      params.require(:transaction).permit(:payment_mode, :transaction_id, :amount_paid, :on_date, :category, :description, :member_id, :status, :penalty, :sub_category, :for_date)
    end
end
