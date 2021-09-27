if AdminUser.find_by(email: 'admin@example.com') == nil
   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end

if Rails.env.development?

    if DatabaseTable.all.count != nil
    DatabaseTable.create!(databasename: "Londevs", databasetable: "USER")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "POST")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "LIKE")
    DatabaseTable.create!(databasename: "Londevs", databasetable: "CONTACTTABLE")
    end 

    if ModuleType.all.count != nil
    ModuleType.create(name: "BACKEND")
    ModuleType.create(name: "FRONTEND")
    end

    Tag.create(name: "html")
    Tag.create(name: "CSS")
    Tag.create(name: "Javascript")
    Tag.create(name: "ruby")
    Tag.create(name: "rubyonrails")
    Tag.create(name: "python")
    
end

if Rails.env.production?
    Tag.create(name: "HTML")
    Tag.create(name: "CSS")
    Tag.create(name: "Javascript")
    Tag.create(name: "Ruby")
    Tag.create(name: "RubyOnRails")
end