# frozen_string_literal: true

class PatientsController < ApplicationController
  def show
    @patient = Patient.find_by(id: params[:id])
    @doctors = @patient.sort_alphabetically(@patient.doctors)
    @ailments = @patient.sort_ailments_by_created_at
    @appointments = @patient.sort_appointments_by_time
    @prescriptions = Prescription.for_appointments(@appointments)
    unless current_user.role == @patient || @doctors.include?(current_user.role)
      redirect_to root_path
    end
  end
end
