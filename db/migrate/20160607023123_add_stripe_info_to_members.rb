class AddStripeInfoToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :stripe_id, :string
  	add_column :members, :card_last4, :string
  	add_column :members, :card_exp_month, :integer
  	add_column :members, :card_exp_year, :integer
  	add_column :members, :card_type, :string
  end
end
