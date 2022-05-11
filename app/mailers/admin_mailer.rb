class AdminMailer < ApplicationMailer
    def authentification_notify
        mail(to: "alextar994@gmail.com", subject: "Кто-то вошёл в админку")
    end
end
