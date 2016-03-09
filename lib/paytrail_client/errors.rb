module PaytrailClient
  class PaytrailClientError < StandardError; end
  class InvalidPaymentError < PaytrailClientError; end
end
