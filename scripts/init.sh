cp ansible.cfg.example ansible.cfg
cp hosts.yml.example hosts.yml
cp vars/tests.rest.yml.example vars/tests.yml
cp vars/services.yml.example vars/services.yml
ansible-galaxy install -r requirements.yml
