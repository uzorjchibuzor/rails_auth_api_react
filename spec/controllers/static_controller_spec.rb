# spec/controllers/static_controller.spec.rb
require "rails_helper"

RSpec.describe StaticController, type: :controller do
  
  describe '#home' do
    it 'returns a json object' do
      get :home
      expect(response).to be_successful
    end
  end
end