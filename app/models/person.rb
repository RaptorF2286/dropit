# frozen_string_literal: true

# Controlador de personas
class Person < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :posts, dependent: :destroy

  has_one_attached :image

  def display_name
    username || "Anonymous_#{id}"
  end

  def to_s
    display_name
  end

  def kreated_posts
    Post.where(person_id: id)
  end
end
