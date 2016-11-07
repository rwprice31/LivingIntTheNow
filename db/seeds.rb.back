# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.destroy_all
User.destroy_all
Position.destroy_all
Schedule.destroy_all


# create store
Store.create(email: "fatboy@fatburger.com", companyName: "Fat Boy Burgers", address: "1495 Buford Hwy", zipCode: "30518")

# create 11 users
u0 = User.create!(email: "amy@fatburger.com", password: "pw", firstName: "Amy", lastName: "Clark", active: true, admin: false, phone: "770-932-6800")
u1 = User.create!(email: "Jim@fatburger.com", password: "pw", firstName: "Jim", lastName: "Kemp", active: true, admin: false, phone: "770-932-1339")
u2 = User.create!(email: "James@fatburger.com", password: "pw", firstName: "James", lastName: "Kenyon", active: true, admin: false, phone: "770-932-9996")
u3 = User.create!(email: "dontcho@fatburger.com", password: "pw", firstName: "Dontcho", lastName: "Dontchev", active: true, admin: false, phone: "770-932-8801")
u4 = User.create!(email: "Russ@fatburger.com", password: "pw", firstName: "Russ", lastName: "Dewitt", active: true, admin: false, phone: "770-932-1400")
u5 = User.create!(email: "Antwane@fatburger.com", password: "pw", firstName: "Antwane", lastName: "Lunne", active: true, admin: false, phone: "770-932-1111")
u6 = User.create!(email: "tony@fatburger.com", password: "pw", firstName: "Tony", lastName: "Bennett", active: true, admin: false, phone: "770-932-2222")
u7 = User.create!(email: "hillary@fatburger.com", password: "pw", firstName: "Hillary", lastName: "Overton", active: true, admin: false, phone: "770-932-3333")
u8 = User.create!(email: "ben@fatburger.com", password: "pw", firstName: "Ben", lastName: "House", active: true, admin: false, phone: "770-932-4444")
u9 = User.create!(email: "poukey@fatburger.com", password: "pw", firstName: "Poukey", lastName: "Doo", active: true, admin: false, phone: "770-932-5555")
u10 = User.create!(email: "Bob@fatburger.com", password: "pw", firstName: "Bobby", lastName: "Merone", active: true, admin: false, phone: "770-932-6666")

# create 5 positions
Position.create(name: "Waiter", editSchedule: false, acceptDenyShift: false, scheduleable: true)
Position.create(name: "Busser", editSchedule: false, acceptDenyShift: false, scheduleable: true)
Position.create(name: "Host/Hostess", editSchedule: false, acceptDenyShift: false, scheduleable: true)
Position.create(name: "Cook", editSchedule: false, acceptDenyShift: false, scheduleable: true)
Position.create(name: "Manager", editSchedule: true, acceptDenyShift: true, scheduleable: true)

# create date variables of work week
d0 = Date.new(2016, 12, 12)
d1 = Date.new(2016, 12, 13)
d2 = Date.new(2016, 12, 14)
d3 = Date.new(2016, 12, 15)
d4 = Date.new(2016, 12, 16)
d5 = Date.new(2016, 12, 17)
d6 = Date.new(2016, 12, 18)

# create time variables for shifts
t0 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t1 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t2 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t3 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t4 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t5 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t6 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t7 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time
t8 = Date.strptime("05-14-2009 19:00","%m-%d-%Y %H:%M").to_time

# create schedules for each user
# create waiter shifts
# create Amy's shifts
Schedule.create(  available: false, date: d0, startTime: t0, endTime: t5)
Schedule.create(  available: true, date: d1, startTime: t0, endTime: t5)
Schedule.create(  available: true, date: d2, startTime: t1, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t3, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Jims's 
Schedule.create(  available: false, date: d0, startTime: t2, endTime: t7)
Schedule.create(  available: false, date: d2, startTime: t4, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t3, endTime: t7)
# create James's
Schedule.create(  available: false, date: d1, startTime: t0, endTime: t4)
Schedule.create(  available: false, date: d3, startTime: t1, endTime: t8)
Schedule.create(  available: false, date: d4, startTime: t1, endTime: t7)
Schedule.create(  available: false, date: d5, startTime: t2, endTime: t6)
# create waiter 
# create Dontcho
Schedule.create(  available: false, date: d0, startTime: t0, endTime: t4)
Schedule.create(  available: true, date: d3, startTime: t1, endTime: t8)
Schedule.create(  available: true, date: d4, startTime: t1, endTime: t7)
Schedule.create(  available: false, date: d6, startTime: t2, endTime: t6)
# create Russ's 
Schedule.create(  available: false, date: d1, startTime: t2, endTime: t7)
Schedule.create(  available: false, date: d2, startTime: t4, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t3, endTime: t7)
# create Host/Ho
# create Antwane
Schedule.create(  available: false, date: d0, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d1, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d2, startTime: t1, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t3, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Tony's 
Schedule.create(  available: false, date: d1, startTime: t2, endTime: t7)
Schedule.create(  available: false, date: d3, startTime: t4, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Hillary
Schedule.create(  available: false, date: d0, startTime: t2, endTime: t7)
Schedule.create(  available: false, date: d5, startTime: t4, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Cooks s
# create Ben's s
Schedule.create(  available: false, date: d0, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d1, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d3, startTime: t1, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t3, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Poukey'
Schedule.create(  available: false, date: d0, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d2, startTime: t0, endTime: t5)
Schedule.create(  available: false, date: d4, startTime: t0, endTime: t8)
Schedule.create(  available: false, date: d5, startTime: t0, endTime: t8)
Schedule.create(  available: false, date: d6, startTime: t3, endTime: t7)
# create Managers Shifts
# create Bobby's shifts
#Schedule.create(user: 11, position: 5, available: false, date: d0, startTime: t0, endTime: t5)
#Schedule.create(user: 11, position: 5, available: false, date: d1, startTime: t0, endTime: t5)
#Schedule.create(user: 11, position: 5, available: false, date: d3, startTime: t1, endTime: t8)
#Schedule.create(user: 11, position: 5, available: false, date: d5, startTime: t3, endTime: t8)
#Schedule.create(user: 11, position: 5, available: false, date: d6, startTime: t3, endTime: t8)
