require "rails_helper"

RSpec.describe FirstWorker, type: :workers do
  let(:user) { User.create!(email: '2@hotmail.com', name: 'Sam', password: 'test1234') }
  let(:user2) { User.create!(email: 'test@hotmail.com', name: 'Pedro', password: 'test1234') }

  it 'when it send weekly email with pending tasks' do
    expect{user; user2;}.to change{ActionMailer::Base.deliveries.count}.by(2)
  end
end
