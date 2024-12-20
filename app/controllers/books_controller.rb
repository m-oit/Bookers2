class BooksController < ApplicationController
  
  def new
    @book = Book.new(title: "", body: "")
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.page(params[:page])
      render :index
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
    @new_book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :edit
    end
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