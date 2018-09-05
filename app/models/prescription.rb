# frozen_string_literal: true

class Prescription < ApplicationRecord
  belongs_to :appointment
  validates :drug, presence: true
  validates :dosage_in_milligrams, presence: true
  validates :dosage_in_milligrams, numericality: true
  delegate :doctor, to: :appointment

  def self.for_appointments(appointment_collection)
    prescriptions = all.select do |prescription|
      appointment_collection.include?(prescription.appointment)
    end
    prescriptions.sort_by do |prescription|
      prescription.appointment.scheduled_for
    end
  end
end
