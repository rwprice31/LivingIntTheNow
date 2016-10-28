# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Store.create(email: nil, companyName: nil, address: nil, zipCode: nil)
Store.create(email: 'example-store@email.com', companyName: 'Example Company Inc.', address: '123 Example Drive', zipCode: '30043')
Store.create(email: 'example-store1@email.com', companyName: 'Example Company Corp.', address: '124 Example Drive', zipCode: '30043')
Store.create(email: 'example-store2@email.com', companyName: 'Example Company -The Original-', address: '125 Example Drive', zipCode: '30043')


#User.create(email: nil, password: nil, firstName: nil, lastName: nil, active: nil, admin: nil, phone: nil, store_id: nil)

#Store 1
User.create(email: 'example-user@email.com', password: 'Password', firstName: 'Amy', lastName: 'Smith', active: true, admin: true, phone: '+1(777)555-6789', store_id: 1)
User.create(email: 'example-user1@email.com', password: 'Password', firstName: 'Bob', lastName: 'Smithy', active: false, admin: true, phone: '+1(777)555-6789', store_id: 1)
User.create(email: 'example-user2@email.com', password: 'Password', firstName: 'Cat', lastName: 'Smither', active: true, admin: false, phone: '+1(777)555-6789', store_id: 1)
User.create(email: 'example-user3@email.com', password: 'Password', firstName: 'Dan', lastName: 'Smithers', active: false, admin: false, phone: '+1(777)555-6789', store_id: 1)

#Store 2
User.create(email: 'example-user4@email.com', password: 'Password', firstName: 'Eve', lastName: 'O\'Smith', active: true, admin: true, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user5@email.com', password: 'Password', firstName: 'Fro', lastName: 'Smithson', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user6@email.com', password: 'Password', firstName: 'Guy', lastName: 'Smithsan', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user7@email.com', password: 'Password', firstName: 'Hop', lastName: 'Smith-san', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user8@email.com', password: 'Password', firstName: 'Ira', lastName: 'Smith-Smith', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user9@email.com', password: 'Password', firstName: 'Jak', lastName: 'Smithle', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user0@email.com', password: 'Password', firstName: 'Kye', lastName: 'Smithsonian', active: true, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user10@email.com', password: 'Password', firstName: 'Lem', lastName: 'Smit', active: false, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user11@email.com', password: 'Password', firstName: 'Man', lastName: 'Mith', active: false, admin: false, phone: '+1(777)555-6789', store_id: 2)
User.create(email: 'example-user12@email.com', password: 'Password', firstName: 'Nik', lastName: 'Smth', active: false, admin: false, phone: '+1(777)555-6789', store_id: 2)

#No Users Tied to Store 3


#Position.create(name: nil, editSchedule: nil, acceptDenyShift: nil, scheduleable: nil, store_id: nil)
## Naming convention: E = editSchedule A = acceptDenyShift S = scheduleable

#Store 1
Position.create(name: 'EAS Manager', editSchedule: true, acceptDenyShift: true, scheduleable: true, store_id: 1)
Position.create(name: 'EA Manager', editSchedule: true, acceptDenyShift: true, scheduleable: false, store_id: 1)
Position.create(name: 'ES Manager', editSchedule: true, acceptDenyShift: false, scheduleable: true, store_id: 1)
Position.create(name: 'AS Manager', editSchedule: false, acceptDenyShift: true, scheduleable: true, store_id: 1)
Position.create(name: 'E Manager', editSchedule: true, acceptDenyShift: false, scheduleable: false, store_id: 1)
Position.create(name: 'S Manager', editSchedule: false, acceptDenyShift: false, scheduleable: true, store_id: 1)
Position.create(name: 'A Manager', editSchedule: false, acceptDenyShift: true, scheduleable: false, store_id: 1)
Position.create(name: 'Employee', editSchedule: false, acceptDenyShift: false, scheduleable: false, store_id: 1)

#Store 2
Position.create(name: 'EAS Manager', editSchedule: true, acceptDenyShift: true, scheduleable: true, store_id: 2)
Position.create(name: 'EA Manager', editSchedule: true, acceptDenyShift: true, scheduleable: false, store_id: 2)
Position.create(name: 'ES Manager', editSchedule: true, acceptDenyShift: false, scheduleable: true, store_id: 2)
Position.create(name: 'AS Manager', editSchedule: false, acceptDenyShift: true, scheduleable: true, store_id: 2)
Position.create(name: 'E Manager', editSchedule: true, acceptDenyShift: false, scheduleable: false, store_id: 2)
Position.create(name: 'S Manager', editSchedule: false, acceptDenyShift: false, scheduleable: true, store_id: 2)
Position.create(name: 'A Manager', editSchedule: false, acceptDenyShift: true, scheduleable: false, store_id: 2)
Position.create(name: 'Employee', editSchedule: false, acceptDenyShift: false, scheduleable: false, store_id: 2)


#Schedule.create(user_id: nil, position_id: nil, available: nil, date: nil, startTime: nil, endTime: nil)

#AM
##Store 1
Schedule.create(user_id: 1, position_id: 1, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
Schedule.create(user_id: 2, position_id: 8, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')

Schedule.create(user_id: 5, position_id: 1, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
Schedule.create(user_id: 6, position_id: 8, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
Schedule.create(user_id: 7, position_id: 8, available: false, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
Schedule.create(user_id: 8, position_id: 8, available: true, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')
Schedule.create(user_id: 9, position_id: 8, available: true, date: '10/27/2016', startTime: '6:00am', endTime: '4:00pm')

#PM
##Store 2
Schedule.create(user_id: 3, position_id: 1, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')
Schedule.create(user_id: 4, position_id: 8, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')

Schedule.create(user_id: 10, position_id: 1, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')
Schedule.create(user_id: 11, position_id: 3, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')
Schedule.create(user_id: 12, position_id: 4, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')
Schedule.create(user_id: 13, position_id: 8, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')
Schedule.create(user_id: 14, position_id: 6, available: false, date: '10/27/2016', startTime: '4:00pm', endTime: '11:00pm')


#Request.create(schedule_id: nil, user_id: nil) **In this case the user_id is who is doing the requesting**
Request.create(schedule_id: 6, user_id: 13)
Request.create(schedule_id: 6, user_id: 14)
Request.create(schedule_id: 7, user_id: 6)
