class UserMailer < ApplicationMailer

    def welcome_email(email)
        mail(to: email, subject: 'PM has invited you to join RevCount')
    end

end
