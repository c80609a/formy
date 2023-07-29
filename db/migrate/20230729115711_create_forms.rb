class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name, null: false
      t.string :tag, null: false

      t.timestamps
    end
  end
end
