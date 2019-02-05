class MemberMailer < ApplicationMailer
  def assign_feedback
    @member = params[:member]
    @feedback = params[:feedback]
    @assignee = params[:assignee]
    mail(to: @assignee.email, subject: "Ajantha Prime Feedback - #{@feedback.subject}")
  end

  def respond_feedback
    @member = params[:member]
    @feedback = params[:feedback]
    @assignee = params[:assignee]
    mail(to: @member.email, subject: "Ajantha Prime Feedback - #{@feedback.subject}")
  end
end
