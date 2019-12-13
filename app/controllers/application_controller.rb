require 'pry'
class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'secret123'
    end
    get '/' do
        erb :home
    end 

    helpers do 
       def logged_in?
        !!current_user
       end 
      
        def current_user
          @current_user ||= User.find_by(username: session[:username]) if session[:username]
        end

        def login(username, password)
            # binding.pry
            user = User.find_by(username: username)
            if user && user.authenticate(password)
                session[:username] = user.username
            else
                redirect '/login'
            end
        end 
    end

end