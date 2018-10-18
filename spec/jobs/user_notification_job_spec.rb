require "rails_helper"

RSpec.describe UserNotificationJob, type: :jobs do
  describe "when it send user welcome email" do
    let(:user_notification) { UserNotificationJob.new }
    let(:user) { User.create!(email: '2@hotmail.com', name: 'Sam', password: 'test1234') }
    let(:mail) { user_notification.perform(user).deliver }

    it 'renders the subject' do
      expect(mail.subject).to eq ('Tasks pending to do')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq ([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(["from@example.com"])
    end
  end
end
