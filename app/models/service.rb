class Service < ApplicationRecord
  validates :name, :description, presence: true

  scope :active, -> { where(active: true) }
end
