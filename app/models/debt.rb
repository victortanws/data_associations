class Debt < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :foreign_key => "user_id_2"

  belongs_to :user

  # Indirect associations

  # Validations

end
