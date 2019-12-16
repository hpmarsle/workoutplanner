class ExercisesController < ApplicationController
    get '/exercises' do 
        if logged_in?
            @exercises = current_user.exercises
            erb :'/exercise/index'
        else 
            redirect '/login'
        end  
    end

    get '/exercises/new' do 
        if logged_in?
            erb :'exercise/new'
        else
            redirect '/login'
        end
    end

    post '/exercises' do 
        if logged_in?
            exercise = Exercise.new(exercise_params)
            if exercise.save
                current_user.exercises << exercise
                redirect "/exercises/#{exercise.id}" 
            else
                redirect '/exercises/new'
            end
        else 
            redirect to '/login'
        end
    end

    get '/exercises/:id' do 
        @exercise = Exercise.find_by_id(params[:id])
        if logged_in? && current_user.exercises.include?(@exercise)
           
            erb :'exercise/show'
        else
            erb :'exercise/warning'
        end
    end

    get '/exercises/:id/edit' do 
        @exercise = Exercise.find_by_id(params[:id])
        if logged_in? && current_user.exercises.include?(@exercise)
            erb :'exercise/edit'
        else
            erb :'exercise/warning'
        end
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

    # put '/exercises/:id' do 

    # end

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