# db/seeds.rb
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)
admin.add_role :admin