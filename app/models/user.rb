class User < ActiveRecord::Base
  
  default_scope { order('id DESC') }
  has_attached_file :image 
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  
  validates_attachment_content_type :image, 
    content_type:  /^image\/(png|gif|jpeg)/,
    message: "Only images allowed"

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  def request_match(user2)
    self.friendships.create(friend: user2)
  end

  def accept_match(user2)
    self.friendships.where(friend: user2).first.update_attribute(:state, "ACTIVE")
  end

  def remove_match(user2)
    inverse_friendship = inverse_friendships.where(user_id: user2).first
    if inverse_friendship
      self.inverse_friendships.where(user_id: user2).first.destroy
    else
      self.friendships.where(friend_id: user2).first.destroy
    end
  end


end
