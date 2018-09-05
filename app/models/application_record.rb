# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sort_alphabetically(persons)
    persons.uniq.sort_by do |person|
      person.last_name.downcase
    end
  end

  def sort_appointments_by_time
    appointments.sort_by(&:scheduled_for)
  end
end
