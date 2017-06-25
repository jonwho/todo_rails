class AddTodoRefToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :todo, foreign_key: true
  end
end
