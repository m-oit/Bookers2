class UsersController < ApplicationController


 def index
   @users = User.all
   @books = Book.all.page(params[:page])
 end
  
  
 def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])  
    @book = Book.new
 end


  def edit
    @user = User.find(params[:id])
  end
  
  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @user, notice: 'プロフィールが更新されました。'
  else
    render :edit
  end
  end

private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end
  
end
