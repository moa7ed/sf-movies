require 'rails_helper'

RSpec.describe Actor, type: :model do
  it { should have_and_belong_to_many(:movies) }
end
