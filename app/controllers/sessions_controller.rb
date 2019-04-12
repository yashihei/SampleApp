class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後に
      log_in user
      redirect_to user
    else
      # エラーメッセージを作成
      flash.now[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
