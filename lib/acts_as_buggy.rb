# ActsAsBuggy
class ApplicationController < ActionController::Base
  before_filter :should_crash?
  
  private
  @@counter = 0
  @@crashines = rand(100)

  def should_crash?
    @@counter += 1
    errors = ["Mysterious undefined random error found"]
    if(@@counter > rand(@@crashines))
      @@crashines = rand(100)
      @@counter = 0
      raise errors[rand(errors.size)]
    end
  end
end