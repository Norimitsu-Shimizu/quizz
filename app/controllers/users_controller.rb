class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id]).decorate
    @questions = @user.questions.order("created_at DESC").page(params[:page]).per(10)
  end
  
end
