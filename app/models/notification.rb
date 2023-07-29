class Notification < ApplicationRecord
  belongs_to :account
  belongs_to :form
end
