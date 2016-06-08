class CardsController < ApplicationController
  before_action :authenticate_member!

  def update
    customer = Stripe::Customer.retrieve(current_member.stripe_id)
    customer.source = params[:stripeToken]
    customer.save

    current_member.update_columns(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_type: params[:card_brand]
    )


    redirect_to edit_member_registration_path, notice: "Successfully updated your card"
  end

  private


end