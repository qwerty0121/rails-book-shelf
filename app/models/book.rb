class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :author_name, presence: true, length: { maximum: 255 }
  validates :read, inclusion: { in: [ true, false ] }
end
