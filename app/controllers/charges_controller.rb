class ChargesController < ApplicationController

  def new
  end
  
  def create
    # Amount in cents
    @amount = 2500

    customer = Stripe::Customer.create(
      :email => current_user[:email],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    # saves the customer ID to database
    current_user.save_stripe_customer_id(customer.id)
    
    # later
    # customer_id = get_stripe_customer_id(current_user[:stripe])
 #    
 #    Stripe::Charge.create(
 #    :amount => 2500,
 #    :currency => 'usd',
 #    :customer => customer_id
 #    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
