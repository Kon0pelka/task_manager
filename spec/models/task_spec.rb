require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validate' do
    it 'is valid with valid attributes' do
      task = build(:task)
      expect(task).to be_valid
    end
  end

  describe 'associations' do
    it 'with user model' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'with task_users model' do
      assc = described_class.reflect_on_association(:task_users)
      expect(assc.macro).to eq :has_many
    end
  end
end
