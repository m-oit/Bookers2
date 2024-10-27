class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  
  def index
    @books = Book.page(params[:page])
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @users = @book.user
    @books = Book.page(params[:page])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
    
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
    

  private
  
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end