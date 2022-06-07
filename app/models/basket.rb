class Basket < ApplicationRecord
  has_many :users_choices
  has_many :items, through: :users_choices
end
