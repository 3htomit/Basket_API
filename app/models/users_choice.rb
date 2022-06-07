class UsersChoice < ApplicationRecord
  belongs_to :item
  belongs_to :basket
end
