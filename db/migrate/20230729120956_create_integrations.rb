class CreateIntegrations < ActiveRecord::Migration[6.1]
  def change
    create_table :integrations do |t|
      t.references :account, null: false, foreign_key: true
      t.string :title, null: false
      t.string :type, null: false
      t.string :tg_chat_id

      t.timestamps
    end
  end
end
