# Performance Testing Tyk with Ansible

## Getting Started
1. Create 3 different servers:
  - Upstream (expose port 8000)
  - Load Generator
  - Tyk (expose port 8080)

2. Modify `hosts.yml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).

3. Run `sudo ansible-playbook playbook.yml` to run performance tests. `sudo` is used to allow ansible to create the performance testing results files on your local machine.

4. View output of performance tests under `bench-upstream.txt`, and `bench-tyk.txt`
