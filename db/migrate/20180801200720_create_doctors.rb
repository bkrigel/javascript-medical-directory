# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :location_city
      t.integer :years_in_practice
      t.integer :specialty_id

      t.timestamps
    end
  end
end
