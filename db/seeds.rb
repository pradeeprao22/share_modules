AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.development?
    DatabaseTable.create!(databasename: "Londevs", databasetable: "USER")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "POST")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "LIKE")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "CONTACTTABLE")
end