class ChangePasswordColumnInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :password, :password_digest 
  end
end
