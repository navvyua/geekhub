class CharactersController < ApplicationController
  before_action :authenticated_only
  before_action :current_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def create
    character = Character.new(character_params)
    if character.save
      redirect_to character
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @character
    else
      render :edit
    end
  end

  def destroy
    @character.delete
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end

  def current_character
    @character = Character.find(params[:id])
  end
end