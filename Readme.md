# Performance Testing with Tyk Ansible
This section of the repo allows you to run performance testing using the Tyk gateway.

## Running Performance Tests
1. Create 3 different servers:
  - Upstream (expose port 8000)
  - Load Generator
  - Tyk (expose port 8080)
2. Copy the `performance-testing/hosts.yaml.example` to `performance-testing/hosts.yaml`.
3. Modify `performance-testing/hosts.yaml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
4. Copy the `performance-testing/playbook.yaml` to `pt-playbook.yaml`.
5. Run `sudo ansible-playbook pt-playbook.yaml -i performance-testing/hosts.yaml -e "pipelining=False"` to run performance tests from the root of the repo. `sudo` is used to allow ansible to create the performance testing results files on your local machine.
6. View output of performance tests under `performance-testing/{bench-upstream,bench-tyk}.txt`
