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

## Settings
### query_type
Values: `REST` and `UDG`

`REST`: Uses a REST request.

`UDG`: Stitches multiple data sources together and presents them as a single GraphQL endpoint.

### udg_depth
Values: `0`, `1` and `2`

`0`: Runs the following GraphQL query:
```

```
query {
  user(id: 1) {
    username
    name
    email
  }
}
```

`1`: Runs the following GraphQL query:

```
query {
  user(id: 1) {
    username
    name
    email
    posts {
      title
      body
    }
  }
}
```


`2`: Runs the following GraphQL query:
```
query {
  user(id: 1) {
    username
    name
    email
    posts {
      title
      body
      comments {
        name
        email
        body
      }
    }
  }
}
```

## Variables
- `vars/tests.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| query_type | `REST` | Sets the query type for the performance testing |
| udg_depth | `0` | Sets the nested query depth |
| enable_auth | `False` | Enable authentication in the performance testing |
| enable_analytics | `False` | Enable analytics gathering in the performance testing |
| enable_quota | `False` | Enable quota tracking in the performance testing |
| enable_rate_limiting | `False` | Enable rate limiting in the performance testing |

- `vars/gateway.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| gateway.service.port | `8080` | Gateway server listening port |
| gateway.secret | `352d20ee67be67f6340b4c0605b044b7` | API secret |

- `vars/apollo-server.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| tyk.service.port | `4000` | Apollo server listening port |

- `vars/upstream.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| upstream.service.port | `8000` | Upstream server listening port |
