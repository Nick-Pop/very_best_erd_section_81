class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :filters,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
