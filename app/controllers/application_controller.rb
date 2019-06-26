
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
  	erb :new
  end

  post '/articles' do
  	@article = Article.create(params)

  	redirect '/articles/' + @article.id.to_s
  end

  get '/articles' do
  	@articles = Article.all
  	erb :index
  end

  get '/articles/:id' do
  	@article = Article.find(params[:id])
  	erb :show
  end

  get '/articles/:id/edit' do
  	erb :edit
  end

  patch '/articles/:id' do
  	@article = Article.find(params[:id])
  	@article.update(title: params[:title])
  	@article.update(content: params[:content])
  	redirect '/articles/' + params[:id]
  end

  delete '/articles/:id' do
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect '/articles'
  end
end
