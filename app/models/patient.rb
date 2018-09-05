# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :ailments
  has_many :appointments
  has_many :doctors, through: :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def sort_ailments_by_created_at
    ailments.sort_by(&:created_at)
  end
end
