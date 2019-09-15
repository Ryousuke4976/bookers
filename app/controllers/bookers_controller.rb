class BookersController < ApplicationController
  def top
  end

  def index
    @bookers = Booker.all
    @booker = Booker.new
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def create
    booker = Booker.new(booker_params)
    booker.save
    redirect_to booker_path(booker)
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    redirect_to booker_path(booker)
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
