require 'rails_helper'

RSpec.describe 'User Integration', type: :request do
  describe 'POST /users' do
    it 'creates a new user' do
      user_params = {
        user: {
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password',
          name: 'Test User'
        }
      }

      post '/users', params: user_params

      expect(response).to have_http_status(303)
      expect(User.count).to eq(1)
    end
  end
end
