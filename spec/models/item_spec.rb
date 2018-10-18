require "rails_helper"

RSpec.describe Item, type: :models do
  let(:item) { Item.new(description: 'hello world') }

  it '#completed?' do
    expect(item.completed?).to be_falsey
  end

  it 'generate CSV' do
    csv_string = Item.to_csv([item])
    expect(csv_string).to include 'hello world'
  end
end
