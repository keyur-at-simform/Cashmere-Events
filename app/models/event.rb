class Event < ApplicationRecord

  has_one_attached :poster
  has_one :guide, dependent: :destroy
  accepts_nested_attributes_for :guide
end
