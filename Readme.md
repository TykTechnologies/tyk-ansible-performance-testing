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
Values: `REST` and `STITCH`

`REST`: Uses a REST request.

`STITCH`: Stitches multiple data sources together and presents them as a single GraphQL endpoint.

`FEDERATE`: Stitches multiple supgrahs and presents them as a supergraph.

### query_depth
`query_type`: `STITCH` and `FEDERATE`
Values: `0`, `1` and `2`

`0`: Runs the following GraphQL query:
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

| Variable             | Default | Comments |
|----------------------| :---------: | --------- |
| query_type           | `REST` | Sets the query type for the performance testing |
| query_depth          | `0` | Sets the nested query depth |
| enable_auth          | `False` | Enable authentication in the performance testing |
| enable_analytics     | `False` | Enable analytics gathering in the performance testing |
| enable_quota         | `False` | Enable quota tracking in the performance testing |
| enable_rate_limiting | `False` | Enable rate limiting in the performance testing |

- `vars/tyk.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| tyk.service.port | `8080` | Tyk gateway server listening port |
| tyk.secret | `352d20ee67be67f6340b4c0605b044b7` | API secret |

- `vars/apollo-server.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| tyk.service.port | `4000` | Apollo server listening port |

- `vars/upstream.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| upstream.service.port | `8000` | Upstream server listening port |
| upstream.services.users.port | `4001` | Upstream server for users federated service listening port |
| upstream.services.posts.port | `4002` | Upstream server for ports federated service listening port |
| upstream.services.comments.port | `4003` | Upstream server for comments federated service listening port |
