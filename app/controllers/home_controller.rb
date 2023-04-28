class HomeController < ApplicationController
  def index
    @boards = Board.limit(10).order(id: :desc)
    respond_to do |format|
      format.html
      format.json  { render json: @boards, status: :ok }
    end
  end
end