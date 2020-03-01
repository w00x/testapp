class TodoItem < ApplicationRecord
  belongs_to :todo

  validates :descripcion, length: { maximum: 5000 }
  validates :descripcion, presence: true
end
