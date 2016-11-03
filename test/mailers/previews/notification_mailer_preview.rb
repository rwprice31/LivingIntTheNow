# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
    
    # Preview this email at
    # http://localhost:3000/rails/mailers/notification_mailer/welcome_email
    def welcome_email
        user = User.take
        NotificationMailer.welcome_email(user)
    end
    
    # Preview this email at
    # http://localhost:3000/rails/mailers/notification_mailer/welcome_email
    def approved_shift
        
        manager = User.first
        user = User.find(2)
        requester = User.find(3)
        shift = user.schedule.first
        NotificationMailer.approved_shift(manager, user, requester, shift)
    end
    
    # Preview this email at
    # http://localhost:3000/rails/mailers/notification_mailer/welcome_email
    def denied_shift
        manager = User.first
        user = User.find(2)
        requester = User.find(3)
        shift = user.schedule.first
        NotificationMailer.denied_shift(manager, requester, shift)
    end
    
end
