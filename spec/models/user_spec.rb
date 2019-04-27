# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid password too short' do
      user = build(:user, password: 'short')
      expect(user).to_not be_valid
    end

    it 'is not valid email' do
      user = build(:user, email: 'qqqasdfwe')
      expect(user).to_not be_valid
    end

    it 'is not valid name empty' do
      user = build(:user, name: '')
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'with image' do
      assc = described_class.reflect_on_association(:image_attachment)
      expect(assc.macro).to eq :has_one
    end

    it 'with task model' do
      assc = described_class.reflect_on_association(:tasks_director)
      expect(assc.macro).to eq :has_many
    end

    it 'with task model' do
      assc = described_class.reflect_on_association(:tasks_executor)
      expect(assc.macro).to eq :has_many
    end
  end
end
