class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :account
      t.references :user

      t.text :content, default: ""
      t.text :html_content, default: ""

      t.boolean :postcard, default: false
      t.boolean :phone, default: false
      t.boolean :sms, default: false
      t.boolean :email, default: false

      t.datetime :scheduled_at
      t.datetime :sent_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
