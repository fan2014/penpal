class MailsController < ApplicationController
  def index
    if signed_in?
      @mails = Mail.all
    else
      render 'sessions/new'
    end
  end
  
  def show
    if signed_in?
      @mails = Mail.all
      @mail = Mail.find_by_id(params[:id])
    else
      render 'sessions/new'
    end
  end
  
  def read_again
    if signed_in?
      @mail = Mail.find_by_id(params[:id])
    else
      render 'sessions/new'
    end
  end
  
  def new
    if signed_in?
      @mails = Mail.all
      @new_mail = Mail.new
    else
      render 'sessions/new'
    end
  end
  
  def create
    mail = Mail.new(mail_params)
    if mail.subject.blank?
      mail.subject="no title"
    end
    mail.user = current_user
    if mail.save
      flash[:success]="Your words have been sent successfully"
      redirect_to mails_path
    else
      flash[:error]="Cannot send"
      render 'sessions/new'
    end
  end
  
  private
    def mail_params
      params.require(:mail).permit(:subject,:content)
    end
end
