class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = current_user.games
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.new(game_params)
    if
      @game.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit

  end

  def update

    if @game.update(game_params)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def destroy
    @game.destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def set_game
    @game = current_user.games.find(params[:id])
  end
end
 