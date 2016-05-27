class Director < ActiveRecord::Base

  has_many :movies, :dependent => :nullify

end
