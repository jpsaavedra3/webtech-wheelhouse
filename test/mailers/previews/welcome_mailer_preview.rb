# Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/welcome
class WelcomeMailerPreview < ActionMailer::Preview
  def welcome
    WelcomeMailer.welcome(User.take)
  end
end
