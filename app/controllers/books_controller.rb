class BooksController < ApplicationController
  def top
  end

  def index
    @bookers = Book.all
    @booker = Book.new
  end

  def show
    @booker = Book.find(params[:id])
  end

  def edit
    @booker = Book.find(params[:id])
  end

  def create
    @booker = Book.new(booker_params)
    if @booker.save
      flash[:notice] = "successfully create!"
      redirect_to book_path(@booker)
    else
      @bookers = Book.all
      render 'index'
    end
  end

  def update
    @booker = Book.find(params[:id])
    if @booker.update(booker_params)
      flash[:notice] = "successfully update!"
      redirect_to book_path(@booker)
    else
      render 'edit'
    end
  end

  def destroy
    booker = Book.find(params[:id])
    booker.delete
    redirect_to books_path
  end

  private
  def booker_params
    params.require(:book).permit(:title, :body)
  end
end
