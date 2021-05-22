# # Create a admin user.
# User.create!(username: "Vu Hoang Thai Duong", 
#             email: "admin@admin.com",
#             password: "foobar", 
#             password_confirmation: "foobar",
#             is_admin: true)

# #Generate other users
# 30.times do |n|
#   username = Faker::Internet.username
#   email = Faker::Internet.free_email(name: username)
#   password = "abcdef"
#   User.create!(username: username,
#               email: email,
#               password: password,
#               password_confirmation: password)
# end

# User.all.each do |user|
#   user.profile_picture.attach(io: File.open("app/assets/images/admin/profile_male.png"), filename: "avatar.jpg", content_type: "image/jpg")
# end

# Position.create(
#   [
#     {name: "Quarterback"},
#     {name: "Running Back"},
#     {name: "Fullback"},
#     {name: "Offensive Line"},
#     {name: "Wide Receivers"},
#     {name: "Tight End"},
#     {name: "Defensive Line"},
#     {name: "Linebacker"},
#     {name: "Cornerback"},
#     {name: "Safety"},
#     {name: "Kicker"},
#     {name: "Punter"},
#     {name: "Return Specialists"},
#     {name: "Long Snapper"}
#   ]
# )

# Nationality.create(
#   [
#     {name: "Nepal"},
#     {name: "Albania"},
#     {name: "Lithuania"},
#     {name: "Madagascar"},
#     {name: "Canada"},
#     {name: "Denmark"},
#     {name: "Finland"},
#     {name: "Guatemala"},
#     {name: "Honduras"},
#     {name: "Ireland"},
#     {name: "Kuwait"}
#   ]
# )

# 30.times do |n|
#   name = Faker::Sports::Football.team
#   stadium = Faker::Address.city
#   manager = Faker::Name.name
#   Club.create!(name: name,
#               stadium: stadium,
#               manager: manager)
# end

# 10.times do |n|
#   name = Faker::Sports::Football.competition
#   website_url = Faker::Internet.url
#   founded_at = rand(10.years).seconds.ago
#   League.create!(name: name,
#                 website_url: website_url,
#                 founded_at: founded_at)
# end

# Club.all.each do |c|
#   c.update!(founded_at: rand(10.years).seconds.ago)
# end

# 300.times do |n|
#   name = Faker::Sports::Football.player
#   dob = rand(40.years).seconds.ago
#   nationality = Nationality.all.sample
#   club = Club.all.sample
#   position = Position.all.sample
#   Player.create!(name: name,
#                 dob: dob,
#                 nationality: nationality,
#                 club: club,
#                 position: position)
# end

# 50.times do |n|
#   league = League.all.sample
#   start_at = rand(40.years).seconds.ago
#   end_at = start_at.next_year(1)
#   Season.create!(league: league,
#                 start_at: start_at,
#                 end_at: end_at)
# end

# 1000.times do |n|
#   season = Season.all.sample
#   start_at = rand(40.years).seconds.ago
#   end_at = start_at + 90.minutes
#   judge_name = Faker::Sports::Football.coach
#   first_team = Club.all.sample
#   second_team = Club.all.sample
#   Match.create!(season: season, start_at: start_at,
#                       end_at: end_at,
#                       first_team: first_team,
#                       second_team: second_team)
# end

Match.all.each do |m|
  judge_name = Faker::Sports::Football.coach
  m.update!(judge_name: judge_name)
end
