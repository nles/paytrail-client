module PaytrailClient
  GEM_ROOT = File.expand_path('../', __FILE__)
end

%w(version errors paytrail_client helpers request payment).each do |file|
  require File.join(PaytrailClient::GEM_ROOT, 'paytrail_client', file)
end
