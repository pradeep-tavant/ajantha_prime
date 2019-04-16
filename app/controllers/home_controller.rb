class HomeController < ApplicationController
  require 'fileutils'
  before_action :authenticate_member!, except: [:location]
  before_action :check_admin, only: [:file_upload, :file_remove]

  def index
    @documents = DOCUMENTS_LINKS # Dir.entries("public/documents")
    @duration = Transaction.sub_categories.keys.last
    @due_date = Transaction.new(sub_category: @duration).due_date
    @transaction = current_member.transactions.Maintenance.where(sub_category: @duration).first
  end

  def file_upload
    if params[:my_file].present?
      tmp = params[:my_file].tempfile
      file = File.join("public", "documents", params[:my_file].original_filename)
      FileUtils.cp tmp.path, file
      flash[:notice] = "Document uploaded successfully."
    else
      flash[:error] = "Please select a valid file to upload."
    end
    redirect_to root_path
  end

  def file_remove
    file = File.join("public", "documents", params[:my_file])
    FileUtils.rm file
    flash[:notice] = "Document removed successfully."
    redirect_to root_path
  end

  def location
  end

  def compose_mail
  end

  def notify_mail
    error = []
    err_index = 1
    if params[:recipients].blank?
      error << "#{err_index}. Kindly add one or more Recipients"
      err_index += 1
    end
    if params[:subject].blank?
      error << "#{err_index}. Subject can't be blank"
      err_index += 1
    end
    if params[:content].blank?
      error << "#{err_index}. Content can't be blank"
      err_index += 1
    end
    unless error.empty?
      flash[:error] = error.join(";&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;").html_safe
      render :compose_mail
    else
      @members = Member.where(id: params[:recipients])
      @members.each do |member|
        MemberMailer.with(member: member, subject: params[:subject], content: params[:content]).notify_members.deliver_later
      end
      flash[:notoce] = "Mail sent successfully."
      redirect_to compose_mail_path
    end
  end

  private

  def check_admin
    unless current_member.admin?
      flash[:error] = "You do not have access for this operation"
      redirect_to root_path
    end
  end

end
