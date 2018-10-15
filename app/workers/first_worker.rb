class FirstWorker
  include Sidekiq::Worker

  def perform(*args)
    @user = User.all
    @user.each do |u|
      UserMailer.email_notification(u).deliver_now
    end
  end
end
