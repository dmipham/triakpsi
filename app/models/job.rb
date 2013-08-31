class Job < ActiveRecord::Base
  attr_accessible :company, :description, :industry, :position, :website, :location, :contact_name, :contact_position, :contact_company, :contact_email
end
