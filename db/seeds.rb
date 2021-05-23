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
#   name = ""
#   loop do
#     name = Faker::Sports::Basketball.team
#    if !Club.exists?(name: name)
#     break
#    end
#   end
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

# 500.times do |n|
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

# Match.all.each do |m|
#   judge_name = Faker::Sports::Football.coach
#   m.update!(judge_name: judge_name)
# end

# file_names = Dir.entries('D:/Documents/Software Engineering/Projects/fff-football-news/app/assets/images/admin')   #=> [".", "..", "config.h", "main.rb"]
# file_names -= ["."]
# file_names -= [".."]
# file_names.each do |n|
#   puts n
# end

# Club.all.each do |c|
#   file_name = file_names.sample
#   c.logo.attach(io: File.open(Rails.root.join("app", "assets", "images", "admin", file_name)), filename: file_name)
# end

# Match.all.each do |m|
#   for i in 10..rand(10..20)
#     event_type = rand(1..5)
#     subject_team_id = [m.first_team_id, m.second_team_id].sample
#     object_team_id = subject_team_id == m.first_team_id ? m.second_team_id : m.first_team_id
#     subject_player_id = Club.find(subject_team_id).players.nil? ? 1 : Club.find(subject_team_id).players.sample.id
#     object_player_id = Club.find(object_team_id).players.nil? ? 1 : Club.find(object_team_id).players.sample.id
#     happened_at = rand(m.start_at..m.end_at)
#     MatchEvent.create(match_id: m.id,
#                         event_type: event_type,
#                         subject_team_id: subject_team_id,
#                         object_team_id: object_team_id,
#                         subject_player_id: subject_player_id,
#                         object_player_id: object_player_id,
#                         happened_at: happened_at)
#   end
# end

# Player.all.each do |p|
#   p.update! club_id: Club.all.sample.id
# end

20.times do |n|
  title = Faker::Lorem.paragraph(sentence_count: 1)
  description = Faker::Lorem.paragraph
  content = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
  Article.create!(user_id: User.find_by(username: "Vu Hoang Thai Duong").id, title: title, description: description, content: content)
end
