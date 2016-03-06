module PaytrailClient
  PaytrailConfiguration = Struct.new(:merchant_id, :merchant_secret)

  class << self
    def configuration
      @config ||= PaytrailConfiguration.new
      yield(@config) if block_given?
      @config
    end
  end
end
