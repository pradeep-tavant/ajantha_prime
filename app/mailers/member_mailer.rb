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

  def respond_booking
    @member = params[:member]
    @booking = params[:booking]
    mail(to: @member.email, subject: "Ajantha Prime Party Hall Booking - #{@booking.reason}")
  end

  def notify_members
    @member = params[:member]
    @subject = params[:subject]
    @content = params[:content]
    mail(to: @member.email, subject: "Ajantha Prime - #{@subject}")
  end
end
