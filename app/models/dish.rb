class Dish < ApplicationRecord
  # Direct associations

  has_many   :filters,
             :dependent => :destroy

  has_many   :favorites,
             :foreign_key => "dishes_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :favorites,
             :source => :venues

  # Validations

end
