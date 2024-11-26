class CreatePolls < ActiveRecord::Migration[7.2]
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :category, null: false, default: 0
      t.integer :state, null: false, default: 0
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
