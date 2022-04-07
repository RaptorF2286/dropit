# frozen_string_literal: true

# Controlador principal
class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  has_one_attached :image
end
