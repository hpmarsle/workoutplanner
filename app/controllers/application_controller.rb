class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
    end
    get '/' do
        "<h1>Hello World</h2>"
        '<p><a>Login</a> or <a>Signup</a></p>'
    end 

    get '/signup' do 
        erb :signup 
    end
    
    post '/signup' do 
        byebug

    end
end