class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :current, ->(post){
    where(post_id: post.id) }

end
