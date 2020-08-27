class Employee < ApplicationRecord
  belongs_to :company
  has_many :attendances
  validates :name, presence: true
end
