# frozen_string_literal: true

class Datum < ApplicationRecord
  validates_presence_of :devise
  validates_length_of :devise, minimum: 1
end
