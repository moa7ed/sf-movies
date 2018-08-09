require 'rails_helper'

RSpec.describe ProductionCompany, type: :model do
  it { should have_and_belong_to_many(:movies) }
end
