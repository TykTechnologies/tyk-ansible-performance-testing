# Performance Testing Tyk with Ansible

## Requirements
1. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Getting Started
1. Clone repo and navigate to the repo directory.

2. Run initalization script to initialize environment `sh scripts/init.sh`.

3. Create 3 different servers to conduct the testing:
  - Upstream: expose port 8000 (ex. c5.2xlarge)
  - Load Generator (ex. c5.9xlarge)
  - Tyk: expose port 8080 (ex. c5.9xlarge)

4. Modify `hosts.yml` file to update ssh variables to your server(s). You can learn more about the hosts file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).

5. Run `sudo ansible-playbook playbook.yml` to run performance tests. `sudo` is used to allow ansible to create the performance testing results files on your local machine.

6. View output of performance tests under `bench-upstream.txt`, and `bench-tyk.txt`

## Variables
| Variable | Default | Comments |
| --------- | :---------: | --------- |
| tyk.service.port | `8080` | Gateway server listening port |
| tyk.secret | `352d20ee67be67f6340b4c0605b044b7` | API secret |
| tyk.use_auth | `False` | Enable authentication in the performance testing |
| tyk.use_analytics | `False` | Enable analytics gathering in the performance testing |
| tyk.use_quota | `False` | Enable quota tracking in the performance testing |
| tyk.use_rate_limiting | `False` | Enable rate limiting in the performance testing |
| upstream.service.port | `8000` | Upstream server listening port |

