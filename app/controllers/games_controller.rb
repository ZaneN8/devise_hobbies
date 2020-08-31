class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :destroy]

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

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def set_game
    @game = current_user.games.find(params[:id])
  end
end
 