class ExercisesController < ApplicationController
    get '/exercises' do 
        erb :'exercise/index'
    end

    post '/exercises' do 
        login(params[:username],params[:password])
        redirect '/exercises'
    end 
end