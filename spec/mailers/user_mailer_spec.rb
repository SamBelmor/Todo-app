require "rails_helper"

RSpec.describe UserMailer, type: :mailers do
  let(:user) { User.create!(email: '2@hotmail.com', name: 'Sam', password: 'test1234') }
  let(:mail) { UserMailer.email_notification(user).deliver }
  
  it '#email_notificacion' do
    expect(ActionMailer::Base.deliveries.include?(mail)).to be_truthy
  end

  describe "when it send user welcome email" do
    it 'renders the subject' do
      expect(mail.subject).to eq ('tasks to do')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq ([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(["from@example.com"])
    end
  end
end
