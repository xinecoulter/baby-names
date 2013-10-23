class Babyname < ActiveRecord::Base
  belongs_to :state

  attr_accessible :name, :birth_year, :gender, :frequency
end