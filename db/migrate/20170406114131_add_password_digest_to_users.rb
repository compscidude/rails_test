class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string

    #or remove_column :users, :email, :string
    #if we wanted to remove a certain column
  end
end
