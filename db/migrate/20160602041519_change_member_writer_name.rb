class ChangeMemberWriterName < ActiveRecord::Migration
  def change
  	rename_column :members, :writer, :type
  end
end
