class Movie < ActiveRecord::Base

  belongs_to :director

  has_many :roles, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :actors, :through => :roles

  validates :title, presence: true
  validates :year, presence: true

end
