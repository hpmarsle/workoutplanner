class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
    end
    get '/' do
        "<h1>Hello World</h2>"
    end 


end