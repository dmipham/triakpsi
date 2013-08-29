class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :grad_year, :birthday, :school, :pledge_semester, :pledge_year, :industry, :company, :job_title, :linkedin, :twitter, :website, :phone, :stripe
  # attr_accessible :title, :body
  
  def save_stripe_customer_id(customer_id)
    update_attributes(:stripe => customer_id)
  end
  
  protected

   def after_sign_up_path_for(resource)
     new_charge_path
   end
  
end
