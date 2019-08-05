class AddGenreIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :genre, foreign_key: true
  end
end
