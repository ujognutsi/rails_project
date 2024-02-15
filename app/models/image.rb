class Image < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 40 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200 }
  validates :wallpaper, presence: true
  has_one_attached :wallpaper
end
