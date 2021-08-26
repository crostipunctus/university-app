class Course < ApplicationRecord
  validates :short_name, presence: true, length: { minimum: 4, maximum: 8 }
  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200}
end