class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhoods,
             :class_name => "Neighborhood"

  has_many   :favorites,
             :foreign_key => "venues_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :dishes,
             :through => :favorites,
             :source => :dishes

  # Validations

end
