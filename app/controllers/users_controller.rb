class UsersController < ApplicationController
    get '/testing' do
        "<h1>Hello World Again</h1>"
    end 
    get '/signup' do 
        erb :'user/signup'
    end

    
    # post '/signup' do 
    #     byebug

    # end

    get '/login' do 

        erb :'user/login'
    end
end