class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, presence: true

  RULES = %i[success_category success_first_try success_level]
end
