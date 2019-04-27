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
      assc = described_class.reflect_on_association(:executor)
      expect(assc.macro).to eq :belongs_to
    end
    it 'with user model' do
      assc = described_class.reflect_on_association(:director)
      expect(assc.macro).to eq :belongs_to
    end
    it 'with docs' do
      assc = described_class.reflect_on_association(:docs_attachments)
      expect(assc.macro).to eq :has_many
    end
  end
end
