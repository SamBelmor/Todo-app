require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it 'return a 200 custom status code' do
    get :index
    expect(response).to have_http_status(200)
  end

  context '#create' do
    it 'create user when the required params are present' do
      user = User.create(email: 'sam@gmail.com', password: 'prueba1234')
      allow(controller).to receive(:current_user).and_return(user)
      params = {
                item: { 
                  title: 'title',
                  description: 'description' 
                }
              }
      post :create, params: params
      expect(user.items.where(title: 'title', description: 'description')).to be_present
    end
  end

  it '#update' do
    user = User.create(email: 'sam@gmail.com', password: 'prueba1234')
    item = Item.create(title: 'title', description: 'description', user_id: user.id)
    put :update, params: { id: item.id, item: {
      title: 'new tile', 
      description: 'new description'
      }
    }
    expect(user.items.where(title: 'new title', description: 'new description'))
  end
end
