class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 } # this is to specify constraints
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end