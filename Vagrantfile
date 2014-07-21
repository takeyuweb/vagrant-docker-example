Vagrant.configure('2') do |config|
  config.vm.define 'db' do |db|
    db.vm.provider 'docker' do |d|
      d.image = 'mysql'
      d.name = 'db'
      d.env = { MYSQL_ROOT_PASSWORD: 'root' }
      d.remains_running = false
    end
    db.vm.network :forwarded_port, guest: 3306, host: 3306
  end
  
  config.vm.define 'myapp' do |myapp|
    myapp.vm.provider 'docker' do |d|
      d.has_ssh = true
      d.build_dir = './myapp'
    end
    myapp.ssh.username = 'docker'
    myapp.ssh.private_key_path = './myapp/docker/insecure_key'
    myapp.ssh.insert_key = false
    myapp.vm.network :forwarded_port, guest: 80, host: 80
  end
end