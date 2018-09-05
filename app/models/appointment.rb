# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :ailment
  validates :duration_in_minutes, presence: true
  validates :duration_in_minutes, numericality: true
  validates :scheduled_for, presence: true

  has_many :prescriptions

  def self.for_current_user(current_user)
    all.select do |appointment|
      appointment.doctor == current_user.role
    end
  end

  def date_and_patient
    "#{scheduled_for.strftime('%A, %b. %-d, %Y @ %l:%M %P')}\
    (#{patient.full_name})"
  end
end
