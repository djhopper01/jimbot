# == Schema Information
#
# Table name: reminders
#
#  id           :integer          not null, primary key
#  account_id   :integer
#  user_id      :integer
#  content      :text             default("")
#  html_content :text             default("")
#  postcard     :boolean          default(FALSE)
#  phone        :boolean          default(FALSE)
#  sms          :boolean          default(FALSE)
#  email        :boolean          default(FALSE)
#  scheduled_at :datetime
#  sent_at      :datetime
#  deleted_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Reminder < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  validate :at_least_one_send_option
  validates :scheduled_at, presence: { allow_blank: false, message: "There was a problem parsing your date and time. Try something like 10/12/2014 and 7:15AM." }
  validates :content, presence: { allow_blank: false, message: "Please tell us about your reminder." }

  attr_accessor :scheduled_at_date, :scheduled_at_time

  def self.scheduled
    where(deleted_at: nil)
  end

  # def scheduled_at_date
  #   scheduled_at.to_date
  # end

  # def scheduled_at_time
  #   scheduled_at.to_time
  # end

private

  def at_least_one_send_option
    unless postcard || phone || sms || email
      errors.add(:method, "Please select at least one of postcard, phone call, text message, or email.")
    end
  end

end
