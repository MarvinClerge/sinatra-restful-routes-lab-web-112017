class RecipeController < ApplicationController

  #INDEX
  get "/recipes" do
    @recipes = Recipe.all
    erb :"recipe/index"
  end

  #CREATE
  get "/recipes/new" do
    erb :"recipe/new"
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "recipes/#{@recipe.id}"
  end

  #EDIT
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :"recipe/edit"
  end

  patch "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  #DELETE
  delete "/recipes/:id/delete" do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end

  #SHOW
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :"recipe/show"
  end




end
