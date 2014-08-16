class UsersController < ApplicationController
  def edit
    if signed_in?
      @user = current_user
    else
      render 'sessions/new'
    end
  end
  
  def update
    if signed_in?
      user = current_user
      user.name = params[:user][:name]
      user.password = params[:user][:password]
      user.password_confirmation = params[:user][:password_confirmation]
      
      if user.save
        flash[:success]="name/password has been saved"
        
        redirect_to mails_path
      else
        flash[:error]="invalid new password, make sure your password is more than 8 characters"
        redirect_to edit_user_path(user)
      end
    else
      render 'sessions/new'
    end
  end
end
