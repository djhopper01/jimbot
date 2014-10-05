class ReminderMailer < ActionMailer::Base
  default from: "jim@jimbot.com"

  def reminder_email(to, from, content)
    @sender = from
    @content = content

    mail(
      to: to,
      subject: "REMINDER: #{@sender} sent you a reminder."
    )
  end
end
