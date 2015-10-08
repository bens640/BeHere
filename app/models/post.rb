class Post < ActiveRecord::Base
  belongs_to :user
  has_many :guests

  scope :user, -> (user){
    where(user_id:user.id)
  }


  E_TYPE = %w[Explore Eat Party]
end
