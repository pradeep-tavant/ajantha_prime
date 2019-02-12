class BookingsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  def index
    @bookings = current_member.bookings
  end

  def all
    unless current_member.admin?
      flash[:error] = "You do not have access for this operation"
      redirect_to root_path
    else
      @bookings = Booking.where(on_date: Date.today..DateTime::Infinity.new)
      render action: 'index'
    end
  end

  def calendar
    @bookings = Booking.all
    @bookings_list = []
    @bookings.each do |booking|
      @bookings_list.push({
        title: "#{booking.private? ? booking.member.login : 'Association'} - #{booking.reason}",
        start: booking.on_date.to_s+booking.start_time.strftime("T%T"),
        end: booking.on_date.to_s+booking.end_time.strftime("T%T"),
        # url: booking_path(booking),
        color: booking.color
      })
    end
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = current_member.bookings.build
    @booking.on_date = params[:on_date]
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      if params[:button] == 'Send'
        MemberMailer.with(member: @booking.member, booking: @booking).respond_booking.deliver_later
      end
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
      check_admin
    end

    def check_admin
      unless current_member.admin? || current_member == @booking.member
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:reason, :on_date, :start_time, :end_time, :notes, :approved, :guest_count, :member_id, :response, :private)
    end
end
