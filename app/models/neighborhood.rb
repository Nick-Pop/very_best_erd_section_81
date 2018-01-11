class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :foreign_key => "neighborhoods_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
