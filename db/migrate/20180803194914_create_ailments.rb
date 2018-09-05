# frozen_string_literal: true

class CreateAilments < ActiveRecord::Migration[5.2]
  def change
    create_table :ailments do |t|
      t.text :description
      t.date :first_noticed_on
      t.boolean :resolved_status, default: false
      t.integer :patient_id

      t.timestamps
    end
  end
end
