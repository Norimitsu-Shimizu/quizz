class AnswersController < ApplicationController

  def update
    answer = Answer.find(params[:id])
    user = User.find_by(id: current_user.id)
    level = Level.where("id > ?", user.level_id).first
    num = 1
    experience = user.experience + num
    if answer.correct.present?
      user.update(experience: experience)
      if level.count == user.experience
        user.update(level_id: level.id)
      end
      redirect_to questions_path
    end
  end
end