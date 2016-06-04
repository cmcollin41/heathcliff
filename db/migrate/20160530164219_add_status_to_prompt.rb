class AddStatusToPrompt < ActiveRecord::Migration
  def change
    add_column :prompts, :status, :integer, default: 0
  end
end
