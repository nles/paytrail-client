module PaytrailClient
  PaytrailConfiguration = Struct.new(:merchant_id, :merchant_secret, :request_timeout)
  def self.configuration
    @config ||= PaytrailConfiguration.new(request_timeout: 30)
    yield(@config) if block_given?
    @config
  end
end
