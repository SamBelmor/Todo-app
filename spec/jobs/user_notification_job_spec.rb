require "rails_helper"

RSpec.describe UserNotificationJob, :type => :jobs do
  it "#perform" do
    user = UserNotificationJob.new
    user.perform('example@gmail.com')
    byebug
  end
end