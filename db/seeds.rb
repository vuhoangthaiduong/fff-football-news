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

User.all.each do |user|
  user.profile_picture.attach(io: File.open("app/assets/images/admin/profile_male.png"), filename: "avatar.jpg", content_type: "image/jpg")
end
