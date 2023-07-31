class OmniauthCallbacksController < ApplicationController
  def twitter
    # If user with given nickname is present get that twitter element and update ot create a twitter account with that user instance
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize

    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to root_path, notice: "User Connected Twitter Account."
  end

  def auth
    request.env['omniauth.auth']
  end
end