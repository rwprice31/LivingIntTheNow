# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#5.times do |i|
#  Product.create(name: "Product ##{i}", description: "A product.")
#end


Store.destroy_all
Position.destroy_all
User.destroy_all
Schedule.destroy_all



number_of_stores = 5
number_of_admins = 1 #PER STORE
number_of_employees = 5 #PER STORE PER POSITION (RIGHT NOW 6)
number_of_requests = 0 #PER STORE


number_of_stores.times do |s|
    #Store.create(email: nil, companyName: nil, address: nil, zipCode: nil)

    store = Store.create(email: "example-store-email#{s}@example.com", companyName: "Example Company #{s}", address: "12#{s} Example Way", zipCode: "30043")


    #Position.create(name: nil, editSchedule: nil, acceptDenyShift: nil, scheduleable: nil, store_id: nil)
    ## Naming convention: E = editSchedule A = acceptDenyShift S = scheduleable
    
    fNameArray = Array.[]("Jp", "Kenny", "Conner", "Mike", "Karl", "Val", "Colin", "Patrick", "Haseeb", "Rodny", "Richard", "Poukey", "Rufus")
    lNameArray = Array.[]("Potter", "Weasley", "Granger", "Voldemort", "Dumbledore", "Snape", "Hagrid", "Malfoy", "Gaunt", "Pease", "Savile", "Percy", "Egerton")
    positionArray = Array.[](

    p0 = Position.create(name: "EAS Manager", editSchedule: true, acceptDenyShift: true, scheduleable: false, store_id: store.id),
    p1 = Position.create(name: "Waiter", editSchedule: true, acceptDenyShift: true, scheduleable: false, store_id: store.id),
    p2 = Position.create(name: "Buser", editSchedule: true, acceptDenyShift: false, scheduleable: true, store_id: store.id),
    p3 = Position.create(name: "Host/Hostess", editSchedule: false, acceptDenyShift: true, scheduleable: true, store_id: store.id),
    p4 = Position.create(name: "Cook", editSchedule: true, acceptDenyShift: false, scheduleable: false, store_id: store.id),
    p5 = Position.create(name: "Scum", editSchedule: false, acceptDenyShift: false, scheduleable: true, store_id: store.id),
    p6 = Position.create(name: "A Manager", editSchedule: false, acceptDenyShift: true, scheduleable: false, store_id: store.id),
    
    employeePosition = Position.create(name: "Manager", editSchedule: false, acceptDenyShift: false, scheduleable: true, store_id: store.id))
    
    #User.create(email: nil, password: nil, firstName: nil, lastName: nil, active: nil, admin: nil, phone: nil, store_id: nil)
    number_of_admins.times do |n| #Admins
        admin = User.create(email: "example-admin-email#{n}@example.com", password: "Password", firstName: "Example Admin #{n}", lastName: "Admin", active: true, admin: true, phone: "+1(777)555-6789", store_id: store.id)
        admin.position<< p0
    end
    count = 0
    positionArray.each do |position|
        number_of_employees.times do |n| #Employees
            user = User.create(email: "example-user-email-#{s}.#{count}.#{n}@example.com", password: "Password", firstName: fNameArray[rand(12)], lastName: lNameArray[rand(12)], active: true, admin: false, phone: "+1(777)555-6789", store_id: store.id)
            user.position<< position
            
             #Schedule.create(user_id: nil, position_id: nil, available: nil, date: nil, startTime: nil, endTime: nil)
            if(n%2 == 0) then
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 11, 28), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 11, 29), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first, available: false, date: Date.new(2016, 11, 30), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 12, 01), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 12, 02), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 12, 03), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: false, date: Date.new(2016, 12, 04), startTime: "6:00am", endTime: "4:00pm")
            else 
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 11, 28), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 11, 29), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 11, 30), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 12, 01), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 12, 02), startTime: "4:00pm", endTime: "11:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 12, 03), startTime: "6:00am", endTime: "4:00pm")
                Schedule.create(user_id: user.id, position_id: user.position.first.id, available: true, date: Date.new(2016, 12, 04), startTime: "4:00pm", endTime: "11:00pm")
            end
        end
        count = count+1
    end
    
    number_of_requests.times do |n|
        Request.create(n, 0)
        Request.create(n, 1)
        Request.create(n, 2)
        Request.create(n, 3)
        Request.create(n, 4)
    end
end



