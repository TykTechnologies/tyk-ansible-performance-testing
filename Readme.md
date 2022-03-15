# Performance Testing Tyk with Ansible

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.

2. Run initalization script to initialize environment `sh scripts/init.sh`.

3. Create 4 different servers to conduct the testing:
  - Upstream: expose port 8000 (ex. c5.2xlarge)
  - Load Generator (ex. c5.9xlarge)
  - Tyk: expose port 8080 (ex. c5.9xlarge)
  - Apollo: expose port 4000 (ex. c5.9xlarge)

4. Modify `hosts.yml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).

5. Run `sudo ansible-playbook playbook.yml` to run performance tests. `sudo` is used to allow ansible to create the performance testing results files on your local machine.

6. View output of performance tests under `./benchmarks/`.

## Documentation
Please check the `/docs` folder for more information about the repo.
