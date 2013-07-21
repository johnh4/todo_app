class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :tasks, :iscomplete?, :completed
  end
end
