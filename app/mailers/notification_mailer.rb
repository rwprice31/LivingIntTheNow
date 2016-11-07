class NotificationMailer < ApplicationMailer
    default from: 'living-in-the-now@litn.com'
    
    def welcome_email(user)
       @user = user
       mail(to: @user.email, subject: 'Welcome to Living in the Now!')
    end
    
    def approved_shift(manager, user, requester, shift)
       @user = user
       @requester = requester
       @manager = manager
       @shift = shift
       
       mail(to: @user.email, subject: 'Your shift was picked up!')
       mail(to: @requester.email, subject: 'Your request was approved!')
       mail(to: @manager.email, subject: 'You approved a request!')
    end
    
    def denied_shift(manager, requester, shift)
       @requester = requester
       @manager = manager
       @shift = shift
       
       mail(to: @requester.email, subject: 'Sorry, your request was denied.')
    end
    
    def update_schedule(date, store)
        User.where(store: store).find_each do |user|
            mail(to: user.email, subject: 'Your schedule for the week of ' + date + '.')
        end
    end
end
