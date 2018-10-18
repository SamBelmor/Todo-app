require "rails_helper"

RSpec.describe User, type: :models do
  it "when the user attach an image" do
    user = User.new
    expect(user.attach_image).to be_nil
  end
end
