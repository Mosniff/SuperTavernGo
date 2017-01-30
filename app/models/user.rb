class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_friendship

  # @foo.friend_request(@bar)
  # @bar.accept_request(@foo)
  # @bar.decline_request(@foo)
  # @bar.remove_friend(@foo)
  # @foo.friends
end
