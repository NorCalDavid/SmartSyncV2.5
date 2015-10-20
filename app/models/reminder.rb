class Reminder < ActiveRecord::Base
  
  belongs_to :property
  has_many :users, through: :property

  validates :name, presence: true
  validates :recipient_phone_number, presence: true
  validates :notification_time, presence: true

  after_create :message

  @@REMINDER_TIME = 30.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
  def message
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.notification_time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    boby = "Hi #{self.recipient}. Your reminder from SmartSync Home: #{self.name} is coming up at #{time_str}. \nReminder Content: #{self.description}"
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