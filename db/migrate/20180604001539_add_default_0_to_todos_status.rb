class AddDefault0ToTodosStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :todos, :status, :integer, default: 0
  end
end
