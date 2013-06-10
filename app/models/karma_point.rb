class KarmaPoint < ActiveRecord::Base
  attr_accessible :user, :label, :value
  belongs_to :user

  after_save  :update_user_karma
 

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def update_user_karma
    self.user.update_karma!
  end
end
