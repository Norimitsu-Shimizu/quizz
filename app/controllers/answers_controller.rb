class AnswersController < ApplicationController

  def update
    answer = Answer.find(params[:id])
    user = User.find_by(id: current_user.id)
    num = 1
    experience = user.experience + num
    if answer.correct.present?
      user.update(experience: experience)
      redirect_to questions_path
    end
  end
end