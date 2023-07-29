# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user
  has_many :forms, dependent: :destroy
  has_many :integrations, dependent: :destroy
end
