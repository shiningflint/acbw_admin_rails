class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error
  validates :category_name, presence: true
end
