require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:titulo) }
  it { should validate_length_of(:titulo).is_at_most(250).on(:create) }
  it { should have_many(:todo_items) }
end
