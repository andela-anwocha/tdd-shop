require "rails_helper"

describe UsersController, type: :controller do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "POST create" do
    context "when valid data is provided" do
      before do
        post :create, { user: attributes_for(:user) } 
      end

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "redirects to the home page" do
        expect(response).to redirect_to "/"
      end

      it "creates a session for the user" do
        expect(session[:user_id]).to eq(1)
      end
    end

    context "when invalid data is provided" do
      before do
        post :create, { user: attributes_for(:user, name: "") }
      end

      it "does not create a new user" do
        expect(User.count).to eq(0)
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "displays flash errors" do
        expect(flash[:errors]).to_not be_empty
      end
    end
  end
end
