class PollsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  def index
    @polls = current_member.admin? ? Poll.all : Poll.where(active: true)
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Opinion Poll was successfully created.'
      redirect_to polls_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Opinion Poll was successfully updated.'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def destroy
    if @poll.destroy
      flash[:success] = 'Opinion Poll was successfully removed.'
    else
      flash[:warning] = 'Error destroying Opinion Poll...'
    end
    redirect_to polls_path
  end

  private

  def set_poll
    @poll = Poll.includes(:vote_options).find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:topic, :active, :start_date, :end_date, vote_options_attributes: [:id, :title, :_destroy])
  end
end
