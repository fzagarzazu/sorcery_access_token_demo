class TreasuresController < ApplicationController
  def show
    @treasure = [{id: 1, value: '10000 coins!'}]
    render json: @treasure
  end
end
