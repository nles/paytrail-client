describe PaytrailClient::Payment do
  it { is_expected.to respond_to(:create) }
  it { is_expected.to respond_to(:verify_payment!) }

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

  describe '.verify_payment!' do
    context 'on valid payment' do
      it 'does not raise' do
        expect { described_class.verify_payment!(15153, 1176557554, '012345ABCDE', '1', '555E0C0DE304938AACA5D594DB72F315')}.not_to raise_error
      end
    end

    context 'on invalid payment' do
      it 'raises error' do
        expect { described_class.verify_payment!(15153, 1176557557, '012345ABCDE', '1', '555E0C0DE304938AACA5D594DB72F315')}.to raise_error(PaytrailClient::InvalidPaymentError)
      end
    end

  end
end
