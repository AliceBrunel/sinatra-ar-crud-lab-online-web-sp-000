
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do 
    @article = Article.create(params)
    @article.save
    
    redirect "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    
    erb :show
  end
  
  get '/articles' do 
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do 
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    #Or @article.update(params[:article])
    @article.save
    
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    #Or Article.destroy(params[:id])
    redirect '/articles'
  end
  
end
