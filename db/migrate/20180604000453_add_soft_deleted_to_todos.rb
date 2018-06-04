class AddSoftDeletedToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :soft_deleted, :boolean, default: false
  end
end
