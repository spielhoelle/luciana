class Mailer < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "A new message from the Website",
      :to => Rails.application.secrets.mail_to,
      :from => Rails.application.secrets.mail_username,
      :reply_to => %("#{name}" <#{email}>)
    }
  end
end
