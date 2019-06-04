# # encoding: utf-8

# Inspec test for recipe uber::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe port(80) do
  it { should be_listening }
end

describe package 'python-pip' do
  it { should be_installed }
end

describe package 'python3' do
  it { should be_installed }
end


describe service("nginx") do
  it { should be_running }
  it { should be_enabled }
end

describe file("/etc/python3/requirements.txt") do
  it { should exist }
 end
