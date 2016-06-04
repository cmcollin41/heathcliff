class AddDateToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :due_date, :date
  end
end
