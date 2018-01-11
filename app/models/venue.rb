class Venue < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "venues_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
