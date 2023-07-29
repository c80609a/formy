# frozen_string_literal: true

class Form < ApplicationRecord
  belongs_to :account
  has_many :notifications, dependent: :destroy
end
