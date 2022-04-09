# frozen_string_literal: true

# Modelo de comentarios
class Comment < ApplicationRecord
  belongs_to :person, dependent: :destroy
  belongs_to :post, dependent: :destroy
end
