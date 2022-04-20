class ApplicationController < ActionController::Base
  # before_action :add_fake_delay

  def add_fake_delay
    sleep(rand(1.5..3.5))
  end
end
