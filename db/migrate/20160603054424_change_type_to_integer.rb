class ChangeTypeToInteger < ActiveRecord::Migration
  def change
  	change_column :members, :type, 'integer USING CAST(type AS integer)'
  end
end
