# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :specialty, optional: true
  has_many :appointments
  has_many :patients, through: :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location_city, presence: true
  validates :years_in_practice, presence: true
  validates :years_in_practice, numericality: true

  def self.for_specialty(specialty)
    all.select do |doctor|
      doctor.specialty_id == specialty.id
    end
  end

  def doctor_with_specialty_and_location
    "Dr. #{full_name} (#{specialty.name}) - #{location_city}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
