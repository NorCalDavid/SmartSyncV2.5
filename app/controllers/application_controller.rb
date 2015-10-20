class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_signup_complete, only: [:create, :update]

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if (current_user && !current_user.email_verified?)
      redirect_to finish_signup_path(current_user)
    end
  end

  private

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def get_user_schedules
    schedules =[]
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      schedules.concat(property.schedules)
    end
    
    return schedules
  end

  def get_user_events
    events =[]
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      events.concat(property.events)
    end
    
    return events
  end

  def get_user_reminders
    reminders =[]
    return nil if current_user.properties.nil?
    
    current_user.properties.each do |property|
      reminders.concat(property.reminders)
    end
    
    return reminders
  end

end
