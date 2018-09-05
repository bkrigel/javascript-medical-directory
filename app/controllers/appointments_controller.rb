# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def new
    if current_user.role_type == "Patient"
      @appointment = Appointment.new
    else
      redirect_to root_path
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to patient_path(@appointment.patient)
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    @doctor = @appointment.doctor
    @patient = @appointment.patient
    unless current_user.role == @appointment.patient ||
           current_user.role == @appointment.doctor
      redirect_to root_path
    end
  end

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    unless current_user.role == @appointment.patient
      redirect_to root_path
    end
    if @appointment.update(appointment_params)
      redirect_to patient_path(@appointment.patient)
    else
      render :edit
    end
  end

  def destroy
    appointment = Appointment.find_by(id: params[:id])
    appointment.destroy
    if current_user.role_type == "Doctor"
      redirect_to specialty_doctor_path(current_user.role.specialty,
                                        current_user.role)
    else
      redirect_to patient_path(current_user.role)
    end
  end

private

  def appointment_params
    params.require(:appointment).permit(
      :duration_in_minutes,
      :doctor_id,
      :ailment_id
    )
          .merge(
            scheduled_for: scheduled_for,
            patient_id: current_user.role.id
          )
  end

  def scheduled_for
    DateTime.strptime("#{params[:appointment][:scheduled_for]} #{params[:appointment]['scheduled_for(4i)']}:#{params[:appointment]['scheduled_for(5i)']}", "%Y-%m-%d %H:%M")
  rescue ArgumentError
    nil
  end
end
