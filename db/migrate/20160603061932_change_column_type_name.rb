class ChangeColumnTypeName < ActiveRecord::Migration
  def change
  	rename_column :members, :type, :member_type
  end
end
