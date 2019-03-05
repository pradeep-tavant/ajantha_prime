class FeedbacksController < ApplicationController
  before_action :authenticate_member!
  before_action :check_admin, except: [:create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  def index
    @feedbacks = if params[:filter] == 'active' || params[:filter].blank?
      Feedback.where(status: ['Open', 'InProgress'])
    elsif params[:filter] == 'closed'
      Feedback.where(status: 'Closed')
    else
      Feedback.all
    end
  end

  # GET /feedbacks/1
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = current_member.feedbacks.build
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)
    @assignee = Member.find_by(email: Setting.FEEDBACK_CONTACT)
    @feedback.assignee ||= @assignee

    if @feedback.save
      MemberMailer.with(member: current_member, feedback: @feedback, assignee: @assignee).assign_feedback.deliver_later
      if current_member.admin?
        redirect_to @feedback, notice: 'Feedback was successfully created.'
      else
        redirect_back(fallback_location: root_path, notice: "Thanks for writing to us. Your feedback was submitted successfully.")
      end
    else
      render :new
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      if params[:button] == 'Send'
        MemberMailer.with(member: @feedback.member, feedback: @feedback, assignee: @feedback.assignee).respond_feedback.deliver_later
      elsif params[:button] == 'Assign'
        MemberMailer.with(member: current_member, feedback: @feedback, assignee: @feedback.assignee).assign_feedback.deliver_later
      end
      redirect_to @feedback, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
    redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.'
  end

  private
    def check_admin
      unless current_member.admin?
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:subject, :content, :status, :priority, :response, :member_id, :assignee_id)
    end
end
