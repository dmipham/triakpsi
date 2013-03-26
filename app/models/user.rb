class User < ActiveRecord::Base
  attr_accessible :birthday, :company, :email, :first_name, :grad_year, :industry, :job_title, :last_name, :linkedin, :phone, :pledge_semester, :pledge_year, :school, :twitter, :website
end
