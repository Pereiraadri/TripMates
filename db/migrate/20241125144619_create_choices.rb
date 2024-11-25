class CreateChoices < ActiveRecord::Migration[7.2]
  def change
    create_table :choices do |t|
      t.text :answer
      t.references :poll, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
