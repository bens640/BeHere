class Post < ActiveRecord::Base
  belongs_to :user
  has_many :guests

  default_scope {order('date ASC')}

  scope :user, -> (user){
    where(user_id:user.id)}

  scope :explore, ->{
    where(event_type: 'explore')}
  scope :eat, ->{
    where(event_type: 'eat')}
  scope :party, ->{
    where(event_type: 'party')}

  scope :today, ->{
    where(date: Date.today)
  }

  scope :am_guest, -> (guest){
    where(id: Guest.tester(guest))
  }



  E_TYPE = %w[Explore Eat Party]


  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("header LIKE ?", "%#{search}%")
  end
end
