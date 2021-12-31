cp ansible.cfg.example ansible.cfg
cp hosts.yml.example hosts.yml
cp vars/tests.yml.example vars/tests.yml
cp vars/upstream.yml.example vars/upstream.yml
cp vars/gateway.yml.example vars/gateway.yml
cp vars/apollo-server.yml.example vars/apollo-server.yml
ansible-galaxy install -r requirements.yml
