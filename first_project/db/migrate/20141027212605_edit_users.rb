class EditUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :email
    add_column :users, :username, :string, null: false, unique: true, default: "user"
  end
end
