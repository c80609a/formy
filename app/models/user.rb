# frozen_string_literal: true

class User < ApplicationRecord
  # noinspection RubyResolve
  include AvatarUploader::Attachment(:avatar)

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true

  has_many :accounts, dependent: :destroy
end
