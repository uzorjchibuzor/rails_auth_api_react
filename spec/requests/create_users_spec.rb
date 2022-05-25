require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  
  include ApiHelpers

  describe '/registrations' do
    context "with valid parameters" do
      before do
        post '/registrations', params: {user: {email: "abc@123.com", password: '123456', password_confirmation: '123456'}}
      end
      
      it "returns user object" do
        expect(json.class).to be (Hash)
      end

      it "returns user object containing the new user email" do
        expect(json["user"]["email"]).to eq ("abc@123.com")
      end
    end
  end
end