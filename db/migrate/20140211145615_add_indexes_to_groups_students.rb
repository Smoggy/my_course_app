class AddIndexesToGroupsStudents < ActiveRecord::Migration
  def change
  	add_index :groups, :name, unique: true
  	add_index :students, :name
  end
end
