class Guest < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :post_id, uniqueness: {scope: :user_id}

  scope :list, ->(post){
    where(post_id: post.id)}

  scope :current, ->(post, user){
    where(post_id: post.id).
    where(user_id: user.id)}

end
