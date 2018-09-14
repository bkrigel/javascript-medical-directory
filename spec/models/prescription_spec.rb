require 'rails_helper'

RSpec.describe Prescription, type: :model do

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

  it "belongs to an Appointment" do
    v = Prescription.reflect_on_association(:appointment)
    expect(v.macro).to eq(:belongs_to)
  end

  it "dosage must be an integer" do
    expect(@test_prescription).to be_valid
    @test_prescription.dosage_in_milligrams = "one hundred"
    expect(@test_prescription).to be_invalid
  end

end
