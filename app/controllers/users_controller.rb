class UsersController < ApplicationController

    get '/signup' do 
        erb :'user/signup'
    end
    
    post '/signup' do 
        @user = User.new(params)
        if @user.save
            login(params[:username], params[:password])
            redirect '/exercises'
        else
            redirect '/signup'
        end
    end  

    get '/login' do 
        if logged_in?
            redirect '/exercises'
        else 
            erb :'user/login'
        end
    end

    post '/login' do 
        @user = User.find(login(params[:username],params[:password]))
        if logged_in?
            redirect '/exercises'
        else
            @failure = "Matching username and password not found"
            redirect '/login'
        end
    end 

    get '/logout' do
        session.clear
        redirect to '/'
    end
end