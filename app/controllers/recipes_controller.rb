class RecipesController < ApplicationController

  skip_before_filter :require_authentication, :only => [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def view
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to "/recipes/index"
    else
      render :new
    end

  @twilio_client.account.sms.messages.create(
          :from => '9259650078',
          :to => '+19255193780',
          :body => "recipes added from seeds.rb!"
        )
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to "/recipes/index"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    redirect_to "recipes/index"
  end
end
