class AddCompletedToPolls < ActiveRecord::Migration[7.2]
  def change
    add_column :polls, :completed, :boolean
  end
end
