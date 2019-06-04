#
# Cookbook:: uber
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
require 'chefspec'
require 'spec_helper'


describe 'uber::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'updates all sources' do
      expect(chef_run).to update_apt_update 'update'
    end
    it 'should install nginx' do
      expect(chef_run).to install_package("nginx")
    end
    it 'should install nodejs' do
      expect(chef_run).to install_package("nodejs")
    end
    it "should install python-pip" do
      expect(chef_run).to install_package("python-pip")
    end
    it "should install python3" do
      expect(chef_run).to install_package("python3")
    end

    it 'creates a requirements file' do
      expect(chef_run).to create_template('/etc/python3/requirements.txt')
   end
   it 'creates NGINX proxy.conf file' do
     expect(chef_run).to create_template('/etc/nginx/sites-available/proxy.conf')
   end
  end
end
