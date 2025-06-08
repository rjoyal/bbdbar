class Testimonial < ApplicationRecord
  validates :name, :content, presence: true

  scope :featured, -> { where(featured: true) }
end
