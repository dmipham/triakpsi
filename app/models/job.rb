class Job < ActiveRecord::Base
  attr_accessible :company, :compensation, :description, :industry, :position, :website, :location
end
