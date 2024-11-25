class CreateGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.text :cover_banner
      t.belongs_to :owner, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
