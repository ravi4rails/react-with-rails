class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  def index
    recipe = resource_class.all.order(created_at: :desc)
    render json: recipe
  end

  def create
    @recipe = resource_class.new(recipe_params)
    render json: @recipe if @recipe.save

    render json: @recipe.errors
  end

  def show
    render json: @recipe if @recipe

    render json: @recipe.errors
  end

  def destroy
    @recipe.destroy
    render json: { message: 'Recipe deleted!' }
  end

  private

  def recipe_params
    params.permit(:name, :image, :ingredients, :instruction)
  end

  def resource_class
    Recipe
  end

  def set_recipe
    @recipe ||= resource_class.find(params[:id])
  end
end
