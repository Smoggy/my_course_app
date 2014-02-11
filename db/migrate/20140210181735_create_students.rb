class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :birth_year
      t. belongs_to :group
      t.timestamps
    end
  end
end
