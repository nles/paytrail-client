describe PaytrailClient::Helpers do
  it { is_expected.to respond_to(:convert_hash_keys) }
  it { is_expected.to respond_to(:convert_key) }

  describe '.convert_hash_keys' do
    it 'converts keys to camel case' do
      expect(described_class.convert_hash_keys(
               snake_case: 'value',
               nested_snake: { ve_no_m: true },
               arr_ay: [{ key: 'val1' }, { key_two: 'val2' }
               ])).to eq(
               'snakeCase' => 'value',
               'nestedSnake' => { 'veNoM' => true },
               'arrAy' => [{ 'key' => 'val1' }, { 'keyTwo' => 'val2' }])
    end
  end
end
