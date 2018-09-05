# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
    @patients = @doctor.sort_alphabetically(@doctor.patients)
    @appointments = @doctor.sort_appointments_by_time
    @prescriptions = Prescription.for_appointments(@appointments)
  end
end
