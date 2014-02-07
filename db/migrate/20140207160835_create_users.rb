class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	    t.string :name
      t.string :login
      t.string :password
      t.string :remember_token, :string
      t.belongs_to :role
      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :remember_token
  end
end
