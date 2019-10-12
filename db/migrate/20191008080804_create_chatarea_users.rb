class CreateChatareaUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chatarea_users do |t|
      t.references :chatarea, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
