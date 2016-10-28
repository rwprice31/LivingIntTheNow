# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#5.times do |i|
#  Product.create(name: "Product ##{i}", description: "A product.")
#end

number_of_stores = 5
number_of_admins = 1 #PER STORE
number_of_employees = 25 #PER STORE

#Store.create(email: nil, companyName: nil, address: nil, zipCode: nil)
number_of_stores.times do |n|
    Store.create(email: 'example-store-email#{n}@example.com', companyName: 'Example Company #{n}', address: '12#{n} Example Way', zipCode: '30043')
end

#User.create(email: nil, password: nil, firstName: nil, lastName: nil, active: nil, admin: nil, phone: nil, store_id: nil)
number_of_stores.times do |s|
    number_of_admins.times do |n| #Admins
        User.create(email: 'example-admin-email#{n}@example.com', password: 'Password', firstName: 'Example Admin #{n}', lastName: 'Admin', active: true, admin: true, phone: '+1(777)555-6789', store_id: s)
    end
    number_of_employees.times do |n| #Employees
        User.create(email: 'example-user-email#{n}@example.com', password: 'Password', firstName: 'Example User #{n}', lastName: 'Employee', active: true, admin: false, phone: '+1(777)555-6789', store_id: s)
    end
end

#Position.create(name: nil, editSchedule: nil, acceptDenyShift: nil, scheduleable: nil, store_id: nil)
## Naming convention: E = editSchedule A = acceptDenyShift S = scheduleable

number_of_stores.times do |n|
    Position.create(name: 'EAS Manager', editSchedule: true, acceptDenyShift: true, scheduleable: true, store_id: s)
    Position.create(name: 'EA Manager', editSchedule: true, acceptDenyShift: true, scheduleable: false, store_id: s)
    Position.create(name: 'ES Manager', editSchedule: true, acceptDenyShift: false, scheduleable: true, store_id: s)
    Position.create(name: 'AS Manager', editSchedule: false, acceptDenyShift: true, scheduleable: true, store_id: s)
    Position.create(name: 'E Manager', editSchedule: true, acceptDenyShift: false, scheduleable: false, store_id: s)
    Position.create(name: 'S Manager', editSchedule: false, acceptDenyShift: false, scheduleable: true, store_id: s)
    Position.create(name: 'A Manager', editSchedule: false, acceptDenyShift: true, scheduleable: false, store_id: s)
    Position.create(name: 'Employee', editSchedule: false, acceptDenyShift: false, scheduleable: false, store_id: s)
end


#Schedule.create(user_id: nil, position_id: nil, available: nil, date: nil, startTime: nil, endTime: nil)

#AM
##Store 1
number_of_stores.times do |s|
    number_of_employees.times do |n|
        Schedule.create(user_id: n, position_id: 8, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
    end
end

#Request.create(schedule_id: nil, user_id: nil) **In this case the user_id is who is doing the requesting**
