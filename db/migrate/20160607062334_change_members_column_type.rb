class ChangeMembersColumnType < ActiveRecord::Migration
  def change
  	change_column :members, :card_exp_month, :string
  	change_column :members, :card_exp_year, :string
  end
end
