class VotesController < ApplicationController
  before_action :authenticate_member!

  def create
    poll = Poll.find_by_id(params[:poll][:id])
    option = poll.vote_options.find_by_id(params[:vote_option][:id])
    p poll
    p option
    p current_member.voted_for?(poll)
    p "-----------------"
    unless current_member.voted_for?(poll)
      option.votes.create({member_id: current_member.id})
      flash[:notice] = "Your vote is saved."
      redirect_to polls_path
    else
      flash[:error] = "Your vote is not saved."
      redirect_to root_path
    end
  end
end
