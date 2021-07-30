# cleaning DB from all User instances and related Garden instances
puts "cleaning up database"
Booking.destroy_all
Garden.destroy_all
User.destroy_all

# making new User instances
User.create!(name: "Nahuel", email: "nahuel@fake.com", password:"nahuel@fake.com")
puts "created User #{User.last.name} with id #{User.last.id}"
User.create!(name: "Chloe", email: "chloe@fake.com", password:"chloe@fake.com")
puts "created User #{User.last.name} with id #{User.last.id}"
User.create!(name: "Kim", email: "kim@fake.com", password:"kim@fake.com")
puts "created User #{User.last.name} with id #{User.last.id}"
User.create!(name: "Andrea", email: "andrea@fake.com", password:"andrea@fake.com")
puts "created User #{User.last.name} with id #{User.last.id}"

puts "Finished creating #{User.count} new Users"
puts ""

# making new Garden instances

Garden.create!(
  name: "Every dogs dream! Grandpa's backyard turned into a playground",
  description: "We know the struggles of living with a pet in a big city. Our Charlie got his private amusement park 4 years ago, now we are only irregularly around and offer our garden for all animal lovers - equipment mainly aimed for dogs but every animal will enjoy it and owners will find their well-deserved break. You can bring your dog, cat, mouse, bee - as long as you clean up behind you!",
  address: "Berlin Schöneberg",
  price_per_day: 18,
  user: User.find_by(name: "Chloe")
)
puts "created #{Garden.last.user.name}'s Garden #{Garden.last.name}"

Garden.create!(
  name: "A cool, quite corner of the world",
  description: "15 years ago we planted a woodland garden, complete with a “forest floor” and a canopy of trees that provide deep shades of green and dappled sunlight. It's long been our private oasis but now we'd like to share this beauty with other 'gardenloving' people. We expect everyone to treat our garden with love and respect so it keeps being the paradise it is. No pets allowed.",
  address: "Berlin Grunewald",
  price_per_day: 38,
  user: User.find_by(name: "Nahuel")
)
puts "created #{Garden.last.user.name}'s Garden #{Garden.last.name}"

Garden.create!(
  name: "Exotic garden for misfit plants",
  description: "As a busy mom and business owner my garden usually comes last on my list of priorities, so it really has to hold its own. I've often taken in discarded plants from job site remodels and tucked them in here and there, where they fill spots and thrive. If you are interested in a more bohemian garden, my garden is the best place to go.",
  address: "Berlin Johannisthal",
  price_per_day: 22,
  user: User.find_by(name: "Kim")
)
puts "created #{Garden.last.user.name}'s Garden #{Garden.last.name}"

Garden.create!(
  name: "Homecoming",
  description: "We’ve envisioned a place with urban elements where we can be part of a community of creative, energetic, open-minded people while living more in tune with nature. After 3 years of planning and building, we finally hope to make this place a place of sharing, learning and laughing. We welcome anyone who wants to become part of our community.",
  address: "Berlin Elsengrund",
  price_per_day: 34,
  user: User.find_by(name: "Andrea")
)
puts "created #{Garden.last.user.name}'s Garden #{Garden.last.name}"

Garden.create!(
  name: "Enchanted Garden Eden on the outskirts of the city",
  description: "Our garden is an enchanted garden. It is wide and open, sloping gently down to a cosmic-blue river. A copse of cypress pines flanks us on one side, with a thicket of peaceful beeches standing guard on the other. Apple trees run through the centre of the garden, casting a lake of claw shadows onto the grass. In autumn, the fiery brilliance of their leaves is a sight: scorching-oranges, burning-browns and molten-reds. Then they drift to the ground as silently and carelessly as an ash cloud, settling in to their eternal rest.",
  address: "Berlin Weissensee",
  price_per_day: 25,
  user: User.find_by(name: "Nahuel")
)
puts "created #{Garden.last.user.name}'s Garden #{Garden.last.name}"
puts ""
puts "All done! Finished creating #{Garden.count} new gardens"

# creating new instances, bookings
Booking.create!(
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 14),
    user_introduction: 'Hello, I would love to book your beautiful garden',
    total_price: 100,
    user: User.find_by(name: "Chloe"),
    garden: Garden.find_by(name: "Every dogs dream! Grandpa's backyard turned into a playground"),
)

Booking.create!(
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 14),
    user_introduction: 'Hello, I would love to book your beautiful garden',
    total_price: 100,
    user: User.find_by(name: "Nahuel"),
    garden: Garden.find_by(name: "A cool, quite corner of the world"),
)

Booking.create!(
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 14),
    user_introduction: 'Hello, I would love to book your beautiful garden',
    total_price: 100,
    user: User.find_by(name: "Kim"),
    garden: Garden.find_by(name: "Exotic garden for misfit plants"),
)

Booking.create!(
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 14),
    user_introduction: 'Hello, I would love to book your beautiful garden',
    total_price: 100,
    user: User.find_by(name: "Andrea"),
    garden: Garden.find_by(name: "Homecoming"),
)
puts ""
puts "All done! Finished creating #{Booking.count} new bookings"
