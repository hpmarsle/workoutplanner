class UsersController < ApplicationController

    get '/signup' do 
        erb :'user/signup'
    end

    
    post '/signup' do 
        @user = User.new(params)
        if @user.save
            login(params[:username], params[:password])
            erb :'exercise/new'
        else
            redirect '/signup'
        end
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