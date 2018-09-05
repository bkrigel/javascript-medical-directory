# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :role, polymorphic: true
  accepts_nested_attributes_for :role
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :password_confirmation, length: { minimum: 6 }
end
