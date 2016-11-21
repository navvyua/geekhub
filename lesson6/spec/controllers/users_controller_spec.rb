require 'rails_helper'

describe UsersController do
  describe 'GET #new' do
    it 'assigns @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the "new" template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'status should be 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        post :create, user: attributes_for(:user)
      end

      it 'creates session' do
        expect(session[:user_id]).to eq(assigns(:user).id)
      end

      it 'creates user profile' do
        user = assigns(:user)
        expect(user.profile).to be_valid
      end
    end

    context 'with invalid params' do
      it 'render "new" template' do
        post :create, user: attributes_for(:user, :invalid)
        expect(response).to render_template('new')
      end
    end
  end
end