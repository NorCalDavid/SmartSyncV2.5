class Reminder < ActiveRecord::Base
  # audited allow_mass_assignment: true
  
  belongs_to :property
  has_many :users, through: :property

  validates :name, presence: true
  validates :recipient_phone_number, presence: true
  validates :notification_time, presence: true

  after_create :message
  after_update :published_changes

  @@REMINDER_TIME = 30.minutes # minutes before appointment

  def executed
    self.executed_count += 1
    self.executed_last = Time.now 
    self.save
  end

  def published_changes
    if self.attribute_changed?(:published)
      if self.published_at
        self.published_at = Time.now
      else
        self.published_at = nil
      end
    end
  end

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