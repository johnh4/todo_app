class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :iscomplete?, default: false, null: false
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
