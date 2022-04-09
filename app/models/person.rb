# frozen_string_literal: true

# Modelo de personas
class Person < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :posts, dependent: :destroy

  has_one_attached :image

  def display_name
    username || "Anonymous_#{id}"
  end

  def followers
    Relationship.where(followed_id: id)
  end

  def following
    Relationship.where(follower_id: id)
  end

  def to_s
    display_name
  end

  def to_param
    return nil unless persisted?

    [id, (username ? username.parameterize : 'Unnamed')].join('-')
  end

  def kreated_posts
    Post.where(person_id: id)
  end
end
