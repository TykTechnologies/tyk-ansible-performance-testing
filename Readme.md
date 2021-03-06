# Performance Testing Tyk with Ansible

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.

2. Run initalization script to initialize environment `sh scripts/init.sh`.

3. Create 5 different servers to conduct the testing:
  - Upstream: expose port 8000 (ex. c5.2xlarge)
  - Load Generator (ex. c5.2xlarge)
  - Tyk: expose port 8080 (ex. c5.2xlarge)
  - Kong: expose port 8000 (ex. c5.2xlarge)
  - Apollo: expose port 4000 (ex. c5.2xlarge)

4. Modify `hosts.yml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).

5. Run `sudo ansible-playbook playbook.yml -t install -t standup -t test` to run performance tests. `sudo` is used to allow ansible to create the performance testing results files on your local machine.

6. View output of performance tests under `./benchmarks/`.

7. Run `ansible-playbook playbook.yml -t cleanup` to cleanup files and turn off services on the machines.

## Documentation
Please check the `/docs` folder for more information about the repo.

- [Tests](/docs/tests.md): Explains the different REST and GraphQL tests available.
- [Analysis](/docs/analyze.md): Explains how to use the `analyze.r` script to generate comparison graphs and csv based on the tests ran.
- [AWS](/docs/aws.md): Explains how to use the `aws.playbook.yml` to standup the resources necessary to run the tests in AWS.
- [GCP](/docs/gcp.md): Explains how to use the `gcp.playbook.yml` to standup the resources necessary to run the tests in GCP.
- [Azure](/docs/azure.md): Explains how to use the `azure.playbook.yml` to standup the resources necessary to run the tests in Azure.
- [Variables](/docs/variables.md): Explains the different variables used in this repo.
