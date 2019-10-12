class CreateChatareas < ActiveRecord::Migration[6.0]
  def change
    create_table :chatareas do |t|
      t.string :name
      t.string :slug
      t.integer :user_limit, default: 5

      t.timestamps
    end
  end
end
