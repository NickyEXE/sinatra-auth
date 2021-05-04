class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      logged_in? && User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

  end

end
