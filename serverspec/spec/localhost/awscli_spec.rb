require 'spec_helper'

# awscli
describe command('pip list | grep awscli') do
  its(:stdout) { should contain('awscli') }
end
