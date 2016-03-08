module PaytrailClient::Helpers
  def self.convert_hash_keys(value)
    case value
    when Array
      value.map(&method(:convert_hash_keys))
    when Hash
      Hash[value.map { |k, v| [convert_key(k), convert_hash_keys(v)] }]
    else
      value
    end
  end

  def self.convert_key(key)
    k = key.to_s
    k.chars.each_with_index do |char, i|
      k[i + 1] = k[i + 1].upcase if char == '_'
    end
    k.delete('_')
  end
end
