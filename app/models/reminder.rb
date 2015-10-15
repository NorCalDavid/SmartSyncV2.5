class Reminder < ActiveRecord::Base
  validates :name, presence: true
  validates :recipient_phone_number, presence: true
  validates :notification_time, presence: true

  after_create :message

  @@REMINDER_TIME = 30.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def message
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new 
    time_str = ((self.notification_time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    boby = "Hi #{self.name}. Reminder: #{self.description} is coming up at #{time_str}."
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.recipient_phone_number,
      :body => body,
    )
    puts message.to
  end

  def when_to_run
    notification_time - @@REMINDER_TIME
  end

  handle_asynchronously :message, :run_at => Proc.new { |i| i.when_to_run }
end