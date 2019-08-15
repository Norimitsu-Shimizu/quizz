class QuestionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def top
  end

  def index
    @genre = Genre.all
    @questions = Question.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @question = Question.new
    @genre = Genre.all
    3.times{@question.answers.build}
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render '/questions/new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.shuffle
  end

  def edit
  end

  def update
  end

  def ranking
    @users = User.order("level_id DESC").limit(10)
    question_ids = Question.group(:user_id).order('count_user_id').limit(10).count(:user_id).keys
    @questions = question_ids.map {|id| User.find(id)}
  end

  private

  def question_params
    params.require(:question).permit(:title, :genre_id, answers_attributes: [:id, :answer, :question_id, :correct]).merge(user_id: current_user.id)
  end

end
