require 'rails_helper'

RSpec.describe Appointment, type: :model do
  
  describe "Appointment model" do

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

    it "belongs to an Ailment" do

    end

    it "must have a scheduled time and duration" do

    end

  end

end
