module PaytrailClient::Payment
  include PaytrailClient::Request

  def self.create(payload)
    post('https://payment.paytrail.com/api-payment/create', payload)
  end
end
