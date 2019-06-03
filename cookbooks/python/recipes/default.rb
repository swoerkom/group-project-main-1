#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update("update") do
  action :update
end

package("python-pip") do
  action :install
end

package("python-minimal") do
  action :install
end
