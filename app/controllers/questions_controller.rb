class QuestionsController < ApplicationController

  def top
  end

  def index
    @genre = Genre.all
    @questions = Question.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @question = Question.new
    @genre = Genre.all
    @question.answers.build
  end

  def create
    question = current_user.questions.create(question_params)
    redirect_to new_question_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.shuffle
  end

  private

  def question_params
    params.require(:question).permit(:title, :genre_id, answers_attributes: [:id, :answer, :question_id, :correct])
  end

end
