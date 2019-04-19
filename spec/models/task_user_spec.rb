require 'rails_helper'

RSpec.describe TaskUser, type: :model do
  describe 'associations' do
    it 'with user model' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'with task model' do
      assc = described_class.reflect_on_association(:task)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
