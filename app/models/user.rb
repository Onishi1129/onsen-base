class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :posts, dependent: :destroy
   attachment :profile_image
   validates :name, uniqueness: true, length: {maximum: 20, minimum: 3}
end