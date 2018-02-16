require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/link'
require 'pg'
require_relative 'lib/database_connection'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  DatabaseConnection.setup('bookmark_manager')

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/add_link' do
    @new_link = params[:new_link]
    @new_title = params[:new_title]
    if Link.valid?(@new_link)
      Link.add_link(@new_link, @new_title)
      redirect '/'
    else
      flash.now[:error] = 'Error - that is not a link.'
    end
  end

  post '/delete_link' do 
    @delete_id = params[:id]
    Link.delete_link(@delete_id)
    redirect '/'
  end

  get '/edit_link/:id' do
    @link = Link.find(params['id'])
    erb(:edit_link)
  end

  post '/update_link/:id' do
    Link.update(params)
    redirect '/'
  end

  run! if app_file == $0
end













