class DeliveryAgent::Email

  def initialize(recipient, content)
    @recipient = recipient
    @content = content
  end

  attr_accessor :recipient, :content

  def send!
    ReminderMailer.reminder_email(recipient.email, "Derek", content).deliver
  end

end
