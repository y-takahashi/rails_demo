class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, limit: 30, null:false
      t.string :password_digest, limit: 60, null:false
      t.string :first_name, limit: 30
      t.string :last_name, limit: 30

      t.timestamps
    end
  end
end
