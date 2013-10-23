class State < ActiveRecord::Base
  has_many :babynames

  attr_accessible :state_abbreviation
end