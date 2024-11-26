class AddInviteTokenToGroups < ActiveRecord::Migration[7.2]
  def change
    add_column :groups, :invite_token, :string
    add_index :groups, :invite_token, unique: true
  end
end
