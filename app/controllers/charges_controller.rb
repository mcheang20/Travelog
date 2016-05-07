class ChargesController < ApplicationController

  def create

    customer = Stripe::Customer.create(
       email: current_user.email,
       card: params[:stripeToken],
       plan: "premium"
     )
    #  charge = Stripe::Charge.create(
    #    customer: customer.id,
    #    amount: @amount,
    #    description: "Blocipedia Premium Account Membership - #{current_user.email}",
    #    currency: 'usd'
    #  )
     current_user.update_attributes(role: "premium")
     flash[:notice] = "Thank you for going premium, #{current_user.email}!"
     redirect_to root_path

     rescue Stripe::CardError => e
       flash[:alert] = e.message
       redirect_to new_charge_path
   end

   def new
     @amount = 500
     @stripe_btn_data = {
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "Blocipedia Premium - #{current_user.email}",
       amount: @amount
     }
   end

   def destroy
     customer = Stripe::Customer.retrieve(current_user.stripe_id)

      current_user.update_attributes(role: "standard")
      flash[:notice] = "You have cancelled your premium account."
      redirect_to root_path
    end
  end
