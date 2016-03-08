describe PaytrailClient::Payment do
  it { is_expected.to respond_to(:create) }

  describe '.create', :vcr do
    context 'minimal set of data' do
      it 'returns a valid response' do
        response = described_class.create(order_number: '1234',
                                          currency: 'EUR',
                                          locale: 'en_US',
                                          url_set: {
                                            success: 'http://www.example.org/success',
                                            failure: 'http://www.example.org/failure',
                                            pending: 'http://www.example.org/pending',
                                            notification: 'http://www.example.org/notification'
                                          },
                                          price: 100.54)

        expect(response['orderNumber']).to eq '1234'
        expect(response['token']).not_to be_nil
      end
    end
  end
end
