module PaytrailClient::Payment
  include PaytrailClient::Request

  def self.create(payload)
    post('https://payment.paytrail.com/api-payment/create', payload)
  end

  def self.verify_payment!(order_number, time_stamp, paid, method, auth_code)
    unless Digest::MD5.hexdigest(
      [order_number,
       time_stamp,
       paid,
       method,
       PaytrailClient.configuration.merchant_secret].join('|')).casecmp(auth_code).zero?
      raise PaytrailClient::InvalidPaymentError
    end
  end
end
