class CreatePolls < ActiveRecord::Migration[7.2]
  def change
    create_table :polls do |t|
      t.string :title
      t.string :kind
      t.string :state
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
