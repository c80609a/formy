class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :account, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
