class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env['omniauth.auth'])

        if @user.persisted?
            @user.remember_me = true
            sign_in_and_redirect @user, event: :authentication
        else
            session['devise.auth'] = request.env['omniauth.auth']
            render :edit
        end
    end
end