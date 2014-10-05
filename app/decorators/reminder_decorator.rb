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

end
