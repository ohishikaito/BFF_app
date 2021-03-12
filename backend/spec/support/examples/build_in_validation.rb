# presence
shared_examples 'Value should be present' do
  it '空文字、もしくは、nilの時は異常値、その他は、原則正常値' do
    aggregate_failures do
      valid_values.each do |valid_value|
        expect(build_stubbed(model_name, field_name => valid_value)).to be_valid
      end

      expect(build_stubbed(model_name, field_name =>   '')).to be_invalid
      expect(build_stubbed(model_name, field_name =>  nil)).to be_invalid
    end
  end
end

# inclusion

# inclusion(boolean)
shared_examples 'Value should be boolean' do
  it 'true か false なら正常値、それ以外は異常値' do
    aggregate_failures do
      expect(build_stubbed(model_name, field_name =>  true)).to be_valid
      expect(build_stubbed(model_name, field_name => false)).to be_valid

      expect(build_stubbed(model_name, field_name =>   nil)).to be_invalid
    end
  end
end

# uniqueness

# length

# numericality