class AddColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :user_id, :integer, :null => false 
    add_column :tasks, :done, :boolean, :null => false, :default => false
  end
end
