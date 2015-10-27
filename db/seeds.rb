# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user = 10
post = 10
message = (post * user)/2
def get_date
  year = 2015
  month = rand(3) + 9
  if [4,6,9,11].include?(month)
    days = 30
  elsif month == 2
    days = 28
  else
    days = 31
  end
  day = rand(days) + 1
  Date.new(year, month, day)
end

def get_time
  h = [8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24].sample
  m = [00, 15, 30, 45].sample
  if h > 12
    part = 'pm'
    h -= 12
  else
    part = 'am'
  end
  h = h.to_s
  m = m.to_s
  h + ':' + m + part
end


User.create(name: 'Ben Shelomovitz', email: "1@2.com", age: 28,
            bio: 'Hi my name is Ben and I am the founder of BeHere. I am from Miami and have graduated Wyncode.',
            profile_pic: Faker::Avatar.image('Ben'), home_state: 'florida', home_city: 'Miami', home_zip: 33160,
            phone:'305-933-3313',
            password_digest: BCrypt::Password.create('123'))
user.times do |x|
  User.create(
          name: Faker::Name.name,
          email: "#{x+1}@#{x+1}.com",
          age: 13 + rand(30),
          bio: Faker::Lorem.paragraph,
          profile_pic: Faker::Avatar.image(Faker::Name.name),
          home_state: Faker::Address.state,
          home_city:Faker::Address.city,
          home_zip:Faker::Address.zip,
          phone: Faker::PhoneNumber.phone_number,
          password_digest: BCrypt::Password.create("#{x}"+"#{x}"+"#{x}")
  )


end
10.times do |g|
  p = 1 + rand(post)
  u = 1 + rand(user)
  Guest.create(
           post_id: p,
           user_id: u
  )
end

post.times do |x|
  c = ['North Miami', 'South Miami', "South Beach", 'Midtown', 'Wynwood'].sample
  l = ['Aroma Espresso Bar','Gigi','Visa 01','Zach the Baker','Coyo'].sample
  b = [true,false].sample
  e = %w[eat party explore].sample
  date = get_date
  time = get_time
  u = [Guest.take, Guest.take]

  Post.create(
      header: Faker::Lorem.sentence(3),
      location: l,
      city: c,
      full_address: Faker::Address.street_address,
      date: date,
      time: time,
      user_id: 1 + rand(user) ,
      over21: b,
      event_type: e,
      private: b,
      guests: u
  )
end

message.times do |m|
  Message.create(
             user_id:1 + rand(user),
             post_id:1 + rand(post),
             message: Faker::Lorem.sentence
  )
end
