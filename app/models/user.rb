# frozen_string_literal: true

# Controlador de usuarios de devise
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :person, dependent: :destroy

  after_create :initialize_person

  def initialize_person
    create_person
  end
end
