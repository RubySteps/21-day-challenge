class CreateTodos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.text :content
    end
  end
end
