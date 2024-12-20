class UsersController < ApplicationController


 def index
   @users = @users = User.page(params[:page])
   @books = Book.all.page(params[:page])
   @user = current_user
   @book = Book.new
 end
  
  
 def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])  
    @book = Book.new
 end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(current_user)
    end
  end
  
  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user, notice: 'You have updated user successfully.'
  else
    render :edit
  end
  end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end
  
end
