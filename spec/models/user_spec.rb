require 'spec_helper'

describe User do
  it { should have_many(:karma_points) }

  describe '#valid?' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:username) }
    it { should ensure_length_of(:username).is_at_least(2).is_at_most(32) }

    it { should validate_presence_of(:email) }

    context 'when a user already exists' do
      before { create(:user) }

      it { should validate_uniqueness_of(:username).case_insensitive }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  end

  describe '.by_karma' do
    it 'returns users in order of highest-to-lowest karma' do
      user_med   = create(:user_with_karma, :karma_count => 500, :points => 2)
      user_low   = create(:user_with_karma, :karma_count => 200, :points => 2)
      user_high  = create(:user_with_karma, :karma_count => 800, :points => 2)

      User.by_karma.should eq [user_high, user_med, user_low]
    end
  end

  describe '#total_karma' do
    let(:user) { create(:user_with_karma, :karma_count => 500, :points => 2) }

    it 'returns the total karma for the user' do
      user.total_karma.should eq 500
    end
  end

  describe '#full_name' do
    let(:user) { build(:user) }

    it 'returns both the first and last names in a single string' do
      user.first_name = 'John'
      user.last_name  = 'Doe'

      user.full_name.should eq 'John Doe'
    end
  end

 describe '#update_karma!' do
    let(:user) { create(:user_with_karma, :karma_count => 100, :points => 5)}

    it 'update karma value in user table when new karma point is created' do
      expect { 
         create(:karma_point, :user => user, :value => 3)
       }.to change {user.karma_count}.from(100).to(103)
    end
  end
end
