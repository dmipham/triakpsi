class ChargesController < ApplicationController

  def new
  end
  
  def create
    @next_event = Event.where("start_at > ?", Date.today.to_date).first

      require 'mandrill' 
 
        m = Mandrill::API.new
        
        message = {  
          :subject=> "Welcome to Triangle AKPsi",  
          :from_name=> "Triangle AKPsi",  
          :html=>"Dear #{current_user[:first_name]},<br/>
	<br/>
	Thank you for your support and membership to our Alumni chapter!<br/>
	<br/>
	We have a lot of great things plan for you this coming year. Don't forget to come to our next #{@next_event.name} at #{@next_event.location} on Thursday #{@next_event.start_at.strftime("%b %d at %l:%M pm")}. It's always a great opportunity to meet new Brothers in the area.<br/>
	<br/>
	Some important information about your membership:</div>
<ul>
	<li>
		This is the email address for you account login at triangleakpsi.com</li>
	<li>
		Your membership dues will automatically be drafted yearly from the card you provided unless you cancel your membership before then.</li>
</ul>

Please let us know if you have any questions or comments.<p> In U... & I... <p>Triangle AKPsi", 
          :autotext => true,
         :to=>[  
           {  
             :email=> "#{current_user[:email]}",  
             :name=> "#{current_user[:first_name]} #{current_user[:last_name]}"  
           }  
         ],
         :from_email=>"triangleakpsi@gmail.com"
        }  
        sending = m.messages.send message  
        puts sending
    
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
    
    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => 2500,
    #   :description => '1 Year Membership',
    #   :currency => "usd"
    # )
    
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
