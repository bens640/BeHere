module ApplicationHelper

  def is_private(bool)
    bool ? 'private' : 'not private'
  end
  def date_mdY(date)
    if date.nil?
      ""
    else
      date.strftime("%m-%d-%Y")
    end
  end

  def guest_list(arr)
    list = []

    arr.each do |g|
      list << g
    end
  end

  def guest?(list,user)
         l = guest_list(list)
         true if l.any? { |u| u.user_id == user.id}
  end

  def owner(post, user) (post.user_id == user.id) ? true : false
  end

end