class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :venues,
             :class_name => "Venue"

  belongs_to :dishes,
             :class_name => "Dish"

  # Indirect associations

  # Validations

end
