class ReminderDecorator < Draper::Decorator
  delegate_all

  ICONS = {
    postcard: "glyphicon-file",
    phone: "glyphicon-earphone",
    sms: "glyphicon-phone",
    email: "glyphicon-envelope",
  }.freeze

  ICONS.keys.each do |send_option|
    define_method "#{send_option.to_s}_classes" do
      klasses = ["#{ICONS[send_option]}"]
      klasses << "medium-enabled" if send("#{send_option}?")
      klasses.join(" ")
    end
  end

  # Form helpers to repopulate these fields when editing
  def scheduled_at_date
    (model.scheduled_at || Time.zone.now + 7.days).strftime("%m/%-d/%Y")
  end

  def scheduled_at_time
    (model.scheduled_at || Time.zone.now + 7.days).strftime("%-l:%M %P")
  end

  def submit_text
    persisted? ? "Update" : "Schedule reminder"
  end

end
