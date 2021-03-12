RSpec.shared_context 'setup' do
  let(:user) { create(:user) }
  let(:auth_token) { user.create_new_auth_token }
  let(:res) { JSON.parse(response.body) }
end