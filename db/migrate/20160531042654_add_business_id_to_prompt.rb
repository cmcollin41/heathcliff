class AddBusinessIdToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :business_id, :integer
  end
end
