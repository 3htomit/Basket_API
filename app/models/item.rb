class Item < ApplicationRecord
  has_many :users_choices
  has_many :baskets, through: :users_choices
end
