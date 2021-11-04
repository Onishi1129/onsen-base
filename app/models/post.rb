class Post < ApplicationRecord
  belongs_to :user
   attachment :image
   validates :onsen_place, presence: true
   validates :onsen_name, presence: true
   validates :caption, presence: true, length: {maximum: 300}


end
