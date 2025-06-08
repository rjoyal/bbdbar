class GalleryImage < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 300]
    attachable.variant :gallery, resize_to_limit: [800, 600]
    attachable.variant :hero, resize_to_limit: [1200, 800]
  end

  validates :title, presence: true
  validates :image, presence: true

  scope :featured, -> { where(featured: true) }
  scope :by_category, ->(cat) { where(category: cat) }
end
