# Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save
 u.update_attribute(:role, 'admin')

puts "Seed finished"
puts "#{User.count} users created"

