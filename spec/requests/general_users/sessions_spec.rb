# spec/requests/general_users/sessions_spec.rb

require 'rails_helper'

RSpec.describe "GeneralUsers::Sessions", type: :request do
  let(:general_user) { create(:general_user) }

  describe "GET /general_users/sign_in" do
    it "renders the sign in page" do
      get new_general_user_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /general_users/sign_in" do
    it "signs the user in" do
      post general_user_session_path, params: {
        general_user: {
          email: general_user.email,
          password: general_user.password
        }
      }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE /general_users/sign_out" do
    it "signs the user out" do
      sign_in general_user
      delete destroy_general_user_session_path
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to match(/ログアウトしました/)
    end
  end
end
