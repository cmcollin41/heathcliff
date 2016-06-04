class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :member
      t.belongs_to :prompt

      t.timestamps null: false
    end
  end
end
