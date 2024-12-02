class AddMetadataToChoices < ActiveRecord::Migration[7.2]
  def change
    add_column :choices, :metadata, :json
  end
end
