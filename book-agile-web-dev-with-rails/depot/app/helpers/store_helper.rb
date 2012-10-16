module StoreHelper


  # Make this method testable by allowing caller to pass in a time. If none
  # passed, we just use the current time.
  def current_time(time = Time.now)
    time
  end

end
