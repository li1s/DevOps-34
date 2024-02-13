Vagrant.configure("2") do |config|
    #Make clickhouse host
    config.vm.define "clickhouse-01" do |click|
        click.vm.box = "centos/7"
        click.vm.network "public_network", 
            bridge: "eno1",
            ip: "192.168.1.10"
        click.ssh.insert_key = false
        click.vm.provision "shell", inline: <<-SHELL
            sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
            systemctl restart sshd.service
            SHELL
    end
    #Make vector hosts
    config.vm.define "vector-01" do |vector|
        vector.vm.box = "centos/7"
        vector.vm.network "public_network", 
            bridge: "eno1",
            ip: "192.168.1.11"
        vector.ssh.insert_key = false
        vector.vm.provision "shell", inline: <<-SHELL
            sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
            systemctl restart sshd.service
            SHELL
    end
    config.vm.provider "virtualbox" do |v|
        v.cpus = 2
        v.memory = 4096
    end
    #config.vm.provision "ansible" do |ansible|
    #    ansible.verbose = "v"
     #   ansible.playbook = "./playbook/site.yml"
      #  ansible.inventory_path = "./playbook/inventory"
       # host_key_checking = false
    #end
end