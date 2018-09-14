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

    it "has a valid date and time" do
      valid_appointment = Appointment.new(
        scheduled_for: DateTime.now,
        duration_in_minutes: 70,
        ailment_id: @test_ailment.id,
        patient_id: @test_patient.role.id,
        doctor_id: @test_doctor.role.id
      )
      invalid_appointment = Appointment.new(
        scheduled_for: "today",
        duration_in_minutes: 70,
        ailment_id: @test_ailment.id,
        patient_id: @test_patient.role.id,
        doctor_id: @test_doctor.role.id
      )
      expect(invalid_appointment).to be_invalid
      expect(valid_appointment).to be_valid
    end

    it "has a valid duration" do
      valid_appointment = Appointment.new(
        scheduled_for: DateTime.now,
        duration_in_minutes: "thirty minutes",
        ailment_id: @test_ailment.id,
        patient_id: @test_patient.role.id,
        doctor_id: @test_doctor.role.id
      )
      expect(valid_appointment).to be_invalid
    end

    it "belongs to an Ailment" do
      v = Appointment.reflect_on_association(:ailment)
      expect(v.macro).to eq(:belongs_to)
    end

  end

end
