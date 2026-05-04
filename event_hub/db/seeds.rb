puts "Cleaning database..."
Review.destroy_all
Registration.destroy_all
Event.destroy_all
Location.destroy_all
Category.destroy_all
User.destroy_all

DEFAULT_PASSWORD = "password123"

puts "Creating users..."
admin = User.create!(name: "Francisca Bravo",     email: "francisca.bravo" + "@eventhub.cl",   role: :admin,   password: DEFAULT_PASSWORD)
u1    = User.create!(name: "Benjamin Carrasco",   email: "bcarrasco" + "@uandes.cl",           role: :regular, password: DEFAULT_PASSWORD)
u2    = User.create!(name: "Valentina Tapia",     email: "vtapia" + "@uandes.cl",              role: :regular, password: DEFAULT_PASSWORD)
u3    = User.create!(name: "Ignacio Fuentes",     email: "ifuentes" + "@uandes.cl",            role: :regular, password: DEFAULT_PASSWORD)
u4    = User.create!(name: "Antonia Salinas",     email: "asalinas" + "@uandes.cl",            role: :regular, password: DEFAULT_PASSWORD)
u5    = User.create!(name: "Cristobal Donoso",    email: "cdonoso" + "@uandes.cl",             role: :regular, password: DEFAULT_PASSWORD)
u6    = User.create!(name: "Javiera Mendoza",     email: "jmendoza" + "@uandes.cl",            role: :regular, password: DEFAULT_PASSWORD)
u7    = User.create!(name: "Sebastian Riquelme",  email: "sriquelme" + "@uandes.cl",           role: :regular, password: DEFAULT_PASSWORD)
u8    = User.create!(name: "Constanza Pizarro",   email: "cpizarro" + "@uandes.cl",            role: :regular, password: DEFAULT_PASSWORD)

puts "Creating categories..."
talks      = Category.create!(name: "Talks",         description: "Academic talks, professional sessions and guest speakers")
workshops  = Category.create!(name: "Workshops",     description: "Hands-on practical learning sessions")
sports     = Category.create!(name: "Sports",        description: "Sports and recreational activities on campus")
social     = Category.create!(name: "Social",        description: "Social events, parties and university celebrations")
study      = Category.create!(name: "Study Groups",  description: "Collaborative sessions to prepare for tests and exams")
culture    = Category.create!(name: "Culture",       description: "Cultural events, exhibitions and artistic showcases")

puts "Creating locations..."
l1 = Location.create!(name: "Main Auditorium",          address: "Mons. Alvaro del Portillo 12455, Las Condes", default_capacity: 350)
l2 = Location.create!(name: "Room B-204",               address: "Building B, second floor",                    default_capacity: 45)
l3 = Location.create!(name: "Football Field",           address: "UANDES sports area",                          default_capacity: 80)
l4 = Location.create!(name: "Patio de los Naranjos",    address: "UANDES central courtyard",                    default_capacity: 250)
l5 = Location.create!(name: "Library Study Room",       address: "Library, third floor",                        default_capacity: 30)
l6 = Location.create!(name: "Main Cafeteria",           address: "Main building, first floor",                  default_capacity: 200)

puts "Creating events..."
e1 = Event.create!(title: "Introduction to Power BI for Engineering Students",
                   description: "Hands-on workshop to learn how to build effective dashboards and visualizations with Power BI. Ideal for students interested in data analysis.",
                   start_date: 2.days.from_now, end_date: 2.days.from_now + 2.hours,
                   max_capacity: 35, status: :published,
                   organizer: u1, category: workshops, location: l2)

e2 = Event.create!(title: "Artificial Intelligence in the Chilean Industry",
                   description: "Panel with representatives from local companies that have implemented AI solutions in their operations. Open Q&A and networking afterwards.",
                   start_date: 1.week.from_now, end_date: 1.week.from_now + 90.minutes,
                   max_capacity: 250, status: :published,
                   organizer: u2, category: talks, location: l1)

e3 = Event.create!(title: "Friday Pickup Football",
                   description: "Open football match for all students. Bring your sneakers and we will form teams when you arrive.",
                   start_date: 3.days.from_now, end_date: 3.days.from_now + 2.hours,
                   max_capacity: 22, status: :published,
                   organizer: u3, category: sports, location: l3)

e4 = Event.create!(title: "Welcome BBQ - New Semester",
                   description: "Welcome event for new students starting the semester. Music, food and activities to meet new people.",
                   start_date: 2.weeks.ago, end_date: 2.weeks.ago + 4.hours,
                   max_capacity: 180, status: :completed,
                   organizer: u4, category: social, location: l4)

e5 = Event.create!(title: "Calculus II Study Session",
                   description: "Collaborative review before the midterm. Bring solved exercises and specific questions.",
                   start_date: 1.week.ago, end_date: 1.week.ago + 3.hours,
                   max_capacity: 20, status: :completed,
                   organizer: u5, category: study, location: l5)

e6 = Event.create!(title: "Networking Night - Cancelled",
                   description: "Professional networking event for senior students. Cancelled due to low registration.",
                   start_date: 5.days.from_now, end_date: 5.days.from_now + 2.hours,
                   max_capacity: 80, status: :cancelled,
                   organizer: u1, category: social, location: l4)

e7 = Event.create!(title: "Advanced Patterns in Ruby on Rails",
                   description: "Internal draft of the workshop. Not yet published, content under preparation.",
                   start_date: 3.weeks.from_now, end_date: 3.weeks.from_now + 2.hours,
                   max_capacity: 25, status: :draft,
                   organizer: u2, category: workshops, location: l2)

e8 = Event.create!(title: "Student Photography Exhibition",
                   description: "Showcase of photographic work made by students during the semester. Free entry.",
                   start_date: 10.days.from_now, end_date: 10.days.from_now + 6.hours,
                   max_capacity: 150, status: :published,
                   organizer: u6, category: culture, location: l4)

e9 = Event.create!(title: "Industrial Engineering Career Fair",
                   description: "Opportunity to meet recruiters from leading consulting and industry firms in Chile.",
                   start_date: 3.weeks.ago, end_date: 3.weeks.ago + 5.hours,
                   max_capacity: 300, status: :completed,
                   organizer: admin, category: talks, location: l1)

puts "Creating registrations..."
# Power BI workshop - almost full
Registration.create!(user: u2, event: e1, status: :confirmed)
Registration.create!(user: u3, event: e1, status: :confirmed)
Registration.create!(user: u4, event: e1, status: :confirmed)
Registration.create!(user: u7, event: e1, status: :waiting_list)
Registration.create!(user: u8, event: e1, status: :waiting_list)

# AI Panel
Registration.create!(user: u1, event: e2, status: :confirmed)
Registration.create!(user: u5, event: e2, status: :confirmed)
Registration.create!(user: u6, event: e2, status: :confirmed)
Registration.create!(user: u8, event: e2, status: :confirmed)

# Football match
Registration.create!(user: u2, event: e3, status: :confirmed)
Registration.create!(user: u4, event: e3, status: :cancelled)
Registration.create!(user: u7, event: e3, status: :confirmed)

# BBQ (completed)
Registration.create!(user: u1, event: e4, status: :confirmed)
Registration.create!(user: u2, event: e4, status: :confirmed)
Registration.create!(user: u3, event: e4, status: :confirmed)
Registration.create!(user: u6, event: e4, status: :confirmed)
Registration.create!(user: u8, event: e4, status: :confirmed)

# Calculus study (completed)
Registration.create!(user: u1, event: e5, status: :confirmed)
Registration.create!(user: u3, event: e5, status: :confirmed)
Registration.create!(user: u6, event: e5, status: :confirmed)

# Photography exhibition
Registration.create!(user: u1, event: e8, status: :confirmed)
Registration.create!(user: u4, event: e8, status: :confirmed)
Registration.create!(user: u5, event: e8, status: :confirmed)

# Career fair (completed)
Registration.create!(user: u1, event: e9, status: :confirmed)
Registration.create!(user: u2, event: e9, status: :confirmed)
Registration.create!(user: u4, event: e9, status: :confirmed)
Registration.create!(user: u7, event: e9, status: :confirmed)

puts "Creating reviews..."
# Reviews for Welcome BBQ
Review.create!(user: u1, event: e4, rating: 5, comment: "Perfect way to kick off the semester. Met a lot of new people.")
Review.create!(user: u2, event: e4, rating: 4, comment: "Great food and atmosphere, just a bit crowded near the grill.")
Review.create!(user: u3, event: e4, rating: 5, comment: "The music selection was on point. Would definitely attend again.")
Review.create!(user: u6, event: e4, rating: 4, comment: "Solid event overall, good organization from the team.")

# Reviews for Calculus II Study Session
Review.create!(user: u1, event: e5, rating: 5, comment: "Super useful before the midterm. The group worked through the hardest exercises.")
Review.create!(user: u3, event: e5, rating: 4, comment: "Productive session, would have liked an extra hour to finish the practice set.")
Review.create!(user: u6, event: e5, rating: 5, comment: "Best study group I have joined this semester. Highly recommend.")

# Reviews for Career Fair
Review.create!(user: u1, event: e9, rating: 5, comment: "Excellent variety of companies. Got two interview invitations on the spot.")
Review.create!(user: u2, event: e9, rating: 4, comment: "Good event but the venue felt a bit small for the number of attendees.")
Review.create!(user: u4, event: e9, rating: 5, comment: "Very well organized. The recruiters were genuinely interested in talking to students.")
Review.create!(user: u7, event: e9, rating: 3, comment: "Useful but most companies were looking for senior students only.")

puts "Done!"
puts "Users: #{User.count} | Categories: #{Category.count} | Locations: #{Location.count}"
puts "Events: #{Event.count} | Registrations: #{Registration.count} | Reviews: #{Review.count}"