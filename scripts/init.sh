cp ansible.cfg.example ansible.cfg
cp hosts.yml.example hosts.yml
cp saas/hosts.yml.example saas/hosts.yml
cp vars/tests.rest.yml.example vars/tests.yml
cp vars/services.yml.example vars/services.yml
cp vars/aws.yml.example vars/aws.yml
cp vars/gcp.yml.example vars/gcp.yml
ansible-galaxy install -r requirements.yml
