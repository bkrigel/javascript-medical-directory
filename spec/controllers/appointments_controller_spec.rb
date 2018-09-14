 require 'rails_helper'
 require 'factory_bot'

RSpec.describe AppointmentsController, type: :controller do

  describe "Appointment actions" do

    before (:each) do
      doctor = FactoryBot.create(:user, :doctor)
      patient = FactoryBot.create(:user, :patient)
      ailment = FactoryBot.create(:ailment)
      ailment.patient_id = patient.id
      appointment = FactoryBot.create(:appointment)
      appointment.ailment_id = ailment.id
      appointment.patient_id = patient.id
      appointment.doctor_id = doctor.id
      prescription = FactoryBot.create(:prescription)
      prescription.appointment_id = appointment.id
    end

    it "can render the show page" do
      get :show, params: {id: appointment.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it "can create a new Appointment" do

    end

  end

end
