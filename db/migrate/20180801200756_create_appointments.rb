# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :scheduled_for
      t.integer :duration_in_minutes
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :ailment_id

      t.timestamps
    end
  end
end
