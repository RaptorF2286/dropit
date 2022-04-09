# frozen_string_literal: true

# Modelo de seguimiento de usuarios
class Relationship < ApplicationRecord
  def display_follower_name
    Person.find(follower_id).display_name
  end

  def display_followed_name
    Person.find(followed_id).display_name
  end

  def self.following?(follower:, followed:)
    !!find_by(follower_id: follower, followed_id: followed)
  end
end
