class MemberMailer < ApplicationMailer
  def assign_feedback
    @member = params[:member]
    @feedback = params[:feedback]
    @assignee = Member.find_by_email("pmsdeva@gmail.com")
    mail(to: @assignee.email, subject: "Ajantha Prime Feedback - #{@feedback.subject}")
  end
end
