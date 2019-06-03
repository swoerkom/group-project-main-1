
required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf vagrant-omnibus )
required_plugins.each do |plugin|
  exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

def adding_requirements
  command = ""
  command += <<~HEREDOC
  cd /home/ubuntu/app
  HEREDOC
  command += <<~HEREDOC
  export LC_ALL=C
  HEREDOC
  command += <<~HEREDOC
  pip install -r ./requirements.txt
  HEREDOC
  command += <<~HEREDOC
  pip install flask
  HEREDOC
  command += <<~HEREDOC
  pip install flask_sslify
  HEREDOC
  command += <<~HEREDOC
  pip install rauth
  HEREDOC
  command += <<~HEREDOC
  python app.py
  HEREDOC

  return command
end


Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.10.100"
    config.hostsupdater.aliases = ["development.local"]
    config.vm.synced_folder "app", "/home/ubuntu/app"
    config.vm.provision "chef_solo" do |chef|
      chef.add_recipe "node::default"
      chef.add_recipe "python::default"
      chef.version = '14.12.9'
  end
  config.vm.provision "shell", inline: adding_requirements, privileged: false
end
