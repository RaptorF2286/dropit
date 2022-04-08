# frozen_string_literal: true

# Controlador principal
class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  has_one_attached :image

  has_and_belongs_to_many :users, dependent: :destroy
  def to_param
    return nil unless persisted?

    [id, title.parameterize].join('-')
  end
end
