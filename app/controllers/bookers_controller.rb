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
    @booker = Booker.new(booker_params)
    if @booker.save
      flash[:notice] = "Successfully create!"
      redirect_to booker_path(@booker.id)
    else
      @bookers = Booker.all
      render 'index'
    end
  end

  def update
    @booker = Booker.find(params[:id])
    if @booker.update(booker_params)
      flash[:notice] = "Successfully update!"
      redirect_to booker_path(@booker.id)
    else
      render 'edit'
    end
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.delete
    redirect_to bookers_path
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
