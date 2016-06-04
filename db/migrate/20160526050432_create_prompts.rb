class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :category
      t.text :description
      t.string :keyword
      t.string :target_audience
      t.string :length
      t.belongs_to :member, index: true
      t.timestamps null: false
    end
  end
end
