class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        # enable :sessions
        # set :session_secret, 'secret123'
    end
    get '/' do
        <<-HTML
            <h1>Hello World</h2>
            <p><a href='/login'>Login</a> or <a href='signup'>Signup</a></p>
        HTML
    end 

    get '/signup' do 
        erb :signup
    end

    
    post '/signup' do 
        byebug

    end

    get '/login' do 

        erb :login
    end
end