class UserMailer < ApplicationMailer

    def welcome_email(email, pm)
        @pm = pm
        mail(to: email, subject: 'PM has invited you to join RevCount')
    end

end
