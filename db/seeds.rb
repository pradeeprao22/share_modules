if AdminUser.find_by(email: 'admin@example.com').nil? && Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

if Rails.env.development?

  if DatabaseTable.all.count.nil?
    DatabaseTable.create!(databasename: 'Londevs', databasetable: 'USER')
    DatabaseTable.create!(databasename: 'Londevs', databasetable: 'POST')
    DatabaseTable.create!(databasename: 'Londevs', databasetable: 'LIKE')
    DatabaseTable.create!(databasename: 'Londevs', databasetable: 'CONTACTTABLE')
  end

  if ModuleType.all.count.nil?
    ModuleType.create(name: 'BACKEND')
    ModuleType.create(name: 'FRONTEND')
  end
end

Tag.create(name: 'HTML')
Tag.create(name: 'CSS')
Tag.create(name: 'Javascript')
Tag.create(name: 'Ruby')
Tag.create(name: 'RubyOnRails')

puts 'DB SEEDED'
