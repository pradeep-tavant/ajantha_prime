class HomeController < ApplicationController
  require 'fileutils'
  before_action :authenticate_member!
  before_action :check_admin, only: [:file_upload, :file_remove]

  def index
    @documents = Dir.entries("public/documents")
    @duration = Transaction.sub_categories.to_a.last[0]
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

  private

  def check_admin
    unless current_member.admin?
      flash[:error] = "You do not have access for this operation"
      redirect_to root_path
    end
  end

end
