# frozen_string_literal: true

RSpec.configure do |config|
  # 記述を省略できる。e.g.）FactoryBot.create(:user)➡️create(:user)
  config.include FactoryBot::Syntax::Methods
end
