class UsersController < ApplicationController

  def new
  end

  def create
    @user = CreateUser.new(registration_params).call
    if @user.save && @user.address.save
      flash[:success] = "User added"
    else
      flash[:warning] = @user.errors.full_messages + @user.address.errors.full_messages
    end
    redirect_to root_url
  end

  private
      
    def registration_params
      params.permit(:name, :email, :house_number, :street, :city)
    end
end
