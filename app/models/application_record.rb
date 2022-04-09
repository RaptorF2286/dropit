# frozen_string_literal: true

# Modelo principal
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def validate_image
    unless image.attached?
      errors.add(:image, 'Image is required')
      return true
    end
    errors.add(:image, 'Selecciona una imagen jpg o png') unless image.content_type.in?(%(image/jpeg image/png))
  end
end
