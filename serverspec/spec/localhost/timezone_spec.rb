require 'spec_helper'

# timezone
describe command('/bin/date') do
  its(:stdout) { should contain('JST') }
end
