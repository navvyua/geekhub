class AudiosController < ApplicationController
  before_action :current_audio, only: [:show, :edit, :update, :destroy]

  def index
    @audios = Audio.all
  end

  def show
  end

  def new
    @audio = Audio.new
  end

  def create
    audio = Audio.new(audio_params)
    if audio.save
      redirect_to audio
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @audio.update(audio_params)
      redirect_to @audio
    else
      render :edit
    end
  end

  def destroy
    @audio.delete
    redirect_to audios_path
  end

  private

  def audio_params
    params.require(:audio).permit(:title)
  end

  def current_audio
    @audio = Audio.find(params[:id])
  end
end