# frozen_string_literal: true

class AilmentsController < ApplicationController
  def new
    if current_user.role_type == "Patient"
      @ailment = Ailment.new
    else
      redirect_to root_path
    end
  end

  def create
    @ailment = Ailment.new(ailment_params)
    if @ailment.save
      redirect_to patient_path(@ailment.patient)
    else
      render :new
    end
  end

  def destroy
    ailment = Ailment.find_by(id: params[:id])
    ailment.destroy
    redirect_to patient_path(ailment.patient)
  end

  def resolve_ailment
    ailment = Ailment.find_by(id: params[:id])
    ailment.resolved_status = true
    ailment.save
    redirect_to patient_path(ailment.patient)
  end

  def unresolve_ailment
    ailment = Ailment.find_by(id: params[:id])
    ailment.resolved_status = false
    ailment.save
    redirect_to patient_path(ailment.patient)
  end

private

  def ailment_params
    params.require(:ailment).permit(
      :first_noticed_on,
      :description
    )
          .merge(
            patient_id: current_user.role.id
          )
  end
end
