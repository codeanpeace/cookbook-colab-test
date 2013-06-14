class AddUserAuthFieldsToCooks < ActiveRecord::Migration
  def change
    add_column :cooks, :email, :string
    add_column :cooks, :password_digest, :string
  end
end
