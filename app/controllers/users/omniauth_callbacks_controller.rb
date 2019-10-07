class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    info = User.find_oauth(request.env['omniauth.auth'])
    @user = info[:user]
    sns_id = info[:sns_id]

    if @user.persisted? #ユーザー登録済みの分岐
      sign_in_and_redirect @user, event: :authentication
    else #ユーザー未登録の分岐
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:password_confirmation] = @user.password
      session[:sns_id] = sns_id
      render '/signup/step1-sns'
    end
  end

  def failure
    redirect_to root_path and return
  end
end