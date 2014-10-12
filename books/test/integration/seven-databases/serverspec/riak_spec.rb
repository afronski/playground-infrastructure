require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |config|
  config.before :all do
    config.path = '/sbin:/usr/sbin'
  end
end

describe service('riak') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8098) do
  it { should be_listening }
end