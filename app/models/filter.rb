class Filter < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  belongs_to :dish

  # Indirect associations

  # Validations

end
