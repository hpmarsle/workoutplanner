class ExercisesController < ApplicationController
    get '/exercises' do 
        erb :'exercise/index'
    end



end