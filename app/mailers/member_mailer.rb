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

  def notify_partyhall_booking
    @member = params[:member]
    @booking = params[:booking]
    @assignee = params[:assignee]
    mail(to: @assignee, subject: "Ajantha Prime New Party Hall Booking - #{@booking.on_date.strftime('%d/%b/%Y')}")
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

  def maintenance_reminder
    @member = params[:member]
    @duration = params[:duration]
    transaction = Transaction.new(category: 'Maintenance', sub_category: @duration)
    @due_date = transaction.due_date
    @amount = transaction.per_month_maintenace * 3
    mail(to: @member.email, subject: "Ajantha Prime - Reminder for Maintenance payment #{@duration}")
  end

  def corpusfund_reminder
    @member = params[:member]
    @duration = params[:duration]
    transaction = Transaction.new(category: 'CorpusFund', sub_category: @duration)
    @due_date = transaction.due_date
    @amount = 2500
    mail(to: @member.email, subject: "Ajantha Prime - Reminder for CorpusFund payment #{@duration}")
  end

  def verify_payment
    @transaction = params[:transaction]
    @member = @transaction.member
    mail(to: @member.email, subject: "Ajantha Prime - Transaction #{@transaction.status}")
  end
end
