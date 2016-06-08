class RegistrationsController < Devise::RegistrationsController
	after_action :stripe_customer, only: [:create]


  private

  def stripe_customer
  	 customer = Stripe::Customer.create(email: current_member.email)
  	 current_member.stripe_id = customer.id
  	 current_member.save
  end

  def sign_up_params
    params.require(:member).permit(:first_name, :last_name, :member_type, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:member).permit(:first_name, :last_name, :member_type, :business_name, :specialty, :stripe_id, :card_exp_year, :card_exp_month, :card_last4, :card_type)
  end
end