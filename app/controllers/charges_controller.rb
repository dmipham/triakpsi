class ChargesController < ApplicationController

  def new
  end
  
  def create
    
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://manage.stripe.com/account
    Stripe.api_key = "sk_test_VmmbXdcfISC2mrcyzwl7wRtZ"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :plan => 'dues',
      :email => current_user[:email],
      :description => current_user[:first_name] + " " + current_user[:last_name]
    )
    
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => 2500,
      :description => '1 Year Membership',
      :currency => "usd"
    )
    
    # saves the customer ID to database
    current_user.save_stripe_customer_id(customer.id)
    
    # later
    # customer_id = User.find(current_user).stripe
#     
#     Stripe::Charge.create(
#     :plan => 'dues',
#     :customer => customer_id
#     )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
