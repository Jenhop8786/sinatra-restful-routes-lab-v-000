class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end#do
  get '/' do
    erb :index
  end#do

  get '/recipes/new' do 
    erb :new
  end#do

  get '/recipes' do 
    @recipes = Recipe.all

    erb :index
  end#do 

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end#do

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end#do

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit 
  end#do

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 

    redirect "recipes/#{@recipe.id}"
  end#do

  delete '/recipes/:id/delete' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 

    redirect "recipes"
  end#do   
end#class