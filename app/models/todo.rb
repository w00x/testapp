class Todo < ApplicationRecord
  has_many :todo_items

  validates :titulo, length: { maximum: 250 }
  validates :titulo, presence: true
end
