class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.boolean :finished
      t.datetime :expires_at

      t.timestamps
    end
  end
end
