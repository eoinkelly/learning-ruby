module SayHelper

  # This code is mixed in (available to) every view under /app/views/say
  # What are the guidelines for what to put here and what to put directly in the controller?
  def get_current_time
    "At the beep it is #{Time.now}"
  end
end
