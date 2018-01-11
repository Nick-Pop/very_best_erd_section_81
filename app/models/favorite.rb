class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :venues,
             :class_name => "Venue"

  belongs_to :dishes,
             :class_name => "Dish"

  # Indirect associations

  # Validations

end
