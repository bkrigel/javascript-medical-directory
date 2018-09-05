# frozen_string_literal: true

class Specialty < ApplicationRecord
  has_many :doctors
end
