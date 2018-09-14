 require 'rails_helper'
 require 'factory_bot'

RSpec.describe AppointmentsController, type: :controller do

  describe "Appointment actions" do

    before (:each) do
      @test_doctor = FactoryBot.create(:user, :doctor)
      @test_patient = FactoryBot.create(:user, :patient)
      @test_ailment = Ailment.create(
        description: "bloody nose",
        first_noticed_on: 1.days.ago,
        patient_id: @test_patient.role.id
      )
      @test_appointment = Appointment.create(
        scheduled_for: DateTime.now,
        duration_in_minutes: 60,
        ailment_id: @test_ailment.id,
        doctor_id: @test_doctor.role.id,
        patient_id: @test_patient.role.id
      )
      @test_prescription = Prescription.create(
        drug: "Placebo",
        dosage_in_milligrams: 500,
        appointment_id: @test_appointment.id
      )
    end

    it "renders the show page" do
      session[:user_id] = @test_doctor.id
      get :show, params: {id: @test_appointment.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    # it "creates a new Appointment" do
    #   session[:user_id] = @test_patient.id
    #   post :create, params: {
    #     scheduled_for: DateTime.now,
    #     duration_in_minutes: 90,
    #     ailment_id: @test_ailment.id,
    #     doctor_id: @test_doctor.role.id,
    #     patient_id: @test_patient.role.id
    #   }
    #   expect(Appointment.all.last.duration_in_minutes).to eq(90)
    # end

  end

end
