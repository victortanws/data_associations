class User < ApplicationRecord
  # Direct associations

  has_many   :payments,
             :dependent => :destroy

  has_many   :incurred_debts,
             :class_name => "Debt",
             :foreign_key => "user_id_2",
             :dependent => :destroy

  has_many   :debts,
             :dependent => :destroy

  has_many   :payment_methods,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
