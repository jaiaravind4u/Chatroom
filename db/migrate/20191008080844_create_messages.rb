class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :chatarea, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.boolean :is_auto, default: false

      t.timestamps
    end
  end
end
