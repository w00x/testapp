require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  it { should validate_presence_of(:descripcion) }
  it { should validate_length_of(:descripcion).is_at_most(5000).on(:create) }
  it { should belong_to(:todo) }
end
