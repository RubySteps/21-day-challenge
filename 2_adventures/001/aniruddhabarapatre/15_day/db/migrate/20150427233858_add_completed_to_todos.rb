class AddCompletedToTodos < ActiveRecord::Migration
  def change
    add_column :to_dos, :completed, :boolean
  end
end
