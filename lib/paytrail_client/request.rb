require 'rest-client'
module PaytrailClient::Request
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def post(url, body)
      call(:post, url, body)
    end

    def call(method, url, body)
      RestClient::Request.execute(
        method: method,
        url: url,
        payload: prepare_body(body).to_json,
        timeout: PaytrailClient.configuration.request_timeout,
        headers: prepare_headers,
        user: PaytrailClient.configuration.merchant_id,
        password: PaytrailClient.configuration.merchant_secret
      ) do |response, _request, _result, &_block|
        parse_body(response.body)
      end
    end

    def prepare_body(body)
      PaytrailClient::Helpers.convert_hash_keys(body)
    end

    def prepare_headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-Verkkomaksut-Api-Version' => '1'
      }
    end

    def parse_body(body)
      JSON.parse(body)
    end
  end
end
