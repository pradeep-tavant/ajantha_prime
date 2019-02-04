class MemberMailer < ApplicationMailer
  def assign_feedback
    @member = params[:member]
    @feedback = params[:feedback]
    @assignee = Member.find_by_email("pradeepkumar.2win@gmail.com")
    mail(to: @assignee.email, subject: 'Ajantha Prime - New Feedback Received')
  end
end
