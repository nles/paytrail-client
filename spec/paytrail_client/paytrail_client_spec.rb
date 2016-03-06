require 'spec_helper'

describe PaytrailClient do
  it { is_expected.to respond_to(:configuration) }
  it 'has a version number' do
    expect(PaytrailClient::VERSION).not_to be nil
  end

  describe '.configuration' do
    it 'yields configuration block' do
      expect { |b| described_class.configuration(&b) }.to yield_with_args
    end

    it 'allows setting the merchant information' do
      described_class.configuration do |c|
        c.merchant_id = 1234
        c.merchant_secret = 'SECRET'
      end
      expect(described_class.configuration.merchant_id).to eq 1234
      expect(described_class.configuration.merchant_secret).to eq 'SECRET'

    end

    it 'raises on undefined configuration keys' do
      expect do
        described_class.configuration do |c|
          c.not_existing = 'value'
        end
      end.to raise_error(NoMethodError)
    end
  end
end
