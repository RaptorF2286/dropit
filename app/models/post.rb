# frozen_string_literal: true

# Modelo de posts
class Post < ApplicationRecord
  belongs_to :person
  has_many :comments
  has_many :people
  has_and_belongs_to_many :people, dependent: :destroy

  has_one_attached :image
  has_rich_text :description

  validates :short_title, presence: true
  validates :short_description, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validate :validate_image

  def to_param
    return nil unless persisted?

    [id, title.parameterize].join('-')
  end

  def kreator
    Person.find(person_id)
  end
end
