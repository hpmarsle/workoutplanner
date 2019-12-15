class ExercisesController < ApplicationController
    get '/exercises' do 
        if logged_in?
            if current_user.exercises
                @exercises = current_user.exercises
                erb :'/exercise/index'
            else 
                redirect '/exercises/new'
            end
        else 
            redirect '/login'
        end
        
    end

    get '/exercises/new' do 

        erb :'exercise/new'
    end

    post '/exercises' do 
        exercise = Exercise.new(exercise_params)
        if exercise.save #1:12:44 in authenticAtion yt video
            current_user.exercises << exercise
            redirect "/exercises/#{current_user.id}" #user.exercises.build()? save the user
        else
            puts "ooohhhh nooooooooooooooo"
        end
        # current_user.exercises << @exercise
    end

    get '/exercises/:id' do 
        @exercise = Exercise.find_by_id(params[:id])
        erb :'exercise/show'
    end

    get '/exercises/:id/edit' do 
        @exercise = Exercise.find_by_id(params[:id])
        erb :'exercise/edit'
    end 

    patch '/exercises/:id' do 
        @exercise = Exercise.find_by_id(params[:id])
        @exercise.name = params[:name]
        @exercise.muscle_group = params[:muscle_group]
        @exercise.length_of_time = params[:length_of_time]
        @exercise.weight = params[:weight]
        @exercise.sets = params[:sets]
        @exercise.reps = params[:reps]
        @exercise.notes = params[:notes]
        @exercise.save
        redirect to "/exercises/#{@exercise.id}"
    end

    put '/exercises/:id' do 

    end

    delete '/exercises/:id' do 
        @exercise = Exercise.find_by_id(params[:id])
        @exercise.delete
        redirect to '/exercises'
    end

    private
    
    def exercise_params
        {name: params[:name], muscle_group: params[:muscle_group], length_of_time: params[:length_of_time], weight: params[:weight], sets: params[:sets], reps: params[:reps], notes: params[:notes]}
        # params.require()
    end
end