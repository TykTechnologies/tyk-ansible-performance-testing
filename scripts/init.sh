cp ansible.cfg.example ansible.cfg
cp hosts.yml.example hosts.yml
cp vars/tests.yml.example vars/tests.yml
cp vars/upstream.yml.example vars/upstream.yml
cp vars/tyk.yml.example vars/tyk.yml
cp vars/apollo-server.yml.example vars/apollo-server.yml
cp vars/kong.yml.example vars/kong.yml
ansible-galaxy install -r requirements.yml
