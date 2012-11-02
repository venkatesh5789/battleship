class StaticPagesController < ApplicationController
  def show_game
    @game_list = Game.all

    render 'static_pages/_games_table'
  end
end
