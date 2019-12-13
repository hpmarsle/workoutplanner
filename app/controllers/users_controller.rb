class UsersController < ApplicationController
    get '/testing' do
        "<h1>Hello World Again</h1>"
    end 
    get '/signup' do 
        erb :'user/signup'
    end

    
    post '/signup' do 
        @user = User.new(params)
        @user.save
        session[:user_id] = @user.id
        login(params[:username], params[:password])
        redirect '/exercises'
    end
       

    get '/login' do 

        erb :'user/login'
    end
    post '/login' do 
        # binding.pry
        login(params[:username],params[:password])
        redirect '/exercises'
    end 
end