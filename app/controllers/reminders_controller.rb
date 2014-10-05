class RemindersController < ApplicationController

  respond_to :json
  respond_to :js, except: :index
  respond_to :html, only: :index

  def index
    @reminders = current_account.reminders.scheduled
    respond_with(@reminders)
  end

  def create
    @reminder = Reminder.new(reminder_params)
    respond_with(@reminder) do |format|
      if @reminder.save
        flash[:notice] = "Good news! We just scheduled your reminder."

        format.js
      else
        flash[:error] = "Oops! Something went wrong. Check out the errors below."

        format.js { render_js_error(@reminder) }
      end
    end
  end

  def update

  end

  def destroy
    @reminder = current_account.reminders.find(params[:id])
    @reminder.archive!
    respond_with(@reminder)
  end

private

  def reminder_params
    params
      .require(:reminder)
      .permit(
        :content,
        :postcard,
        :phone,
        :sms,
        :email,
        :scheduled_at_date,
        :scheduled_at_month,
      )
      .merge(scheduled_at: parsed_scheduled_at)
      # .merge(user: current_user)
      # .merge(account: current_account)
  end

  def parsed_scheduled_at
    Timeliness.parse("#{scheduled_at_date} #{scheduled_at_time}")
  end

  def scheduled_at_date
    @scheduled_at_date ||= strip_whitespace(params[:reminder].delete(:scheduled_at_date))
  end

  def scheduled_at_time
    @scheduled_at_time ||= strip_whitespace(params[:reminder].delete(:scheduled_at_time))
  end

  def strip_whitespace(string)
    string.gsub(" ", "") rescue nil
  end

end
