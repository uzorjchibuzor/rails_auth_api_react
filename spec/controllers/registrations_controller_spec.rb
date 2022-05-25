# spec/controllers/registrations_controller.spec.rb
require "rails_helper"

RSpec.describe RegistrationsController, type: :controller do
  describe "#create" do
    context "with correct parameters" do
      let(:user_params) {
        {email: 'abc@example.com', password: '123456', password_confirmation: '123456'}
      }
      
      it "creates a new user" do
        post :create, params: { user: user_params }
        expect(User.count).to eq(1) 
      end

      it "creates a new user with actual inputed params" do
        post :create, params: { user: user_params }
        expect(User.first.email).to eq('abc@example.com') 
      end

    end
  end
  
end