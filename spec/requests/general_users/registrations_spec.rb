# spec/requests/general_users/registrations_spec.rb

require 'rails_helper'

RSpec.describe "GeneralUsers::Registrations", type: :request do
  let(:general_user) { create(:general_user) }

  describe "GET /general_users/sign_up" do
    it "renders the sign up page" do
      get new_general_user_registration_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /general_users" do
    it "creates a new user" do
      post general_user_registration_path, params: {
        general_user: {
          name: "Test User",
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "PUT /general_users" do
    let(:general_user) { create(:general_user) }

    it "updates the user's profile" do
      sign_in general_user
      put general_user_registration_path, params: {
        general_user: {
          name: "Updated Name",
          current_password: "password"
        }
      }
      general_user.reload
      expect(general_user.name).to eq("Updated Name")
      expect(response).to redirect_to(general_users_profile_path)
    end
  end
end
