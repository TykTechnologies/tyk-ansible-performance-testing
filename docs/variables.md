## Variables
### Tests
`vars/tests.yml`

| Variable | Default | Comments |
|----------------------| :---------: | --------- |
| query_type | `REST` | Sets the query type for the performance testing. Can be set to `REST`, `STITCH`, or `FEDERATE` |
| query_depth | `0` | Sets the nested query depth |
| limit_cores | `false` | Allows limiting the number of cores used by the service. Only available for Tyk and Apollo. |
| enable_auth | `False` | Enable authentication in the performance testing. Only available for Tyk. |
| enable_analytics | `False` | Enable analytics gathering in the performance testing. Only available for Tyk. |
| enable_quota | `False` | Enable quota tracking in the performance testing. Only available for Tyk. |
| enable_rate_limiting | `False` | Enable rate limiting in the performance testing. Only available for Tyk. |
| test_services | `[ kong ]` | List of services you would like to test Tyk against. |

### Services
`vars/services.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| services.upstream.service.port| `8000` | Upstream server listening port |
| services.upstream.subgraphs.users.port | `4001` | Upstream server for users federated service listening port |
| services.upstream.subgraphs.posts.port | `4002` | Upstream server for ports federated service listening port |
| services.upstream.subgraphs.comments.port | `4003` | Upstream server for comments federated service listening port |
| services.tyk.secret | `352d20ee67be67f6340b4c0605b044b7` | API secret |
| services.tyk.service.port | `8080` | Tyk gateway server listening port |
| services.kong.service.port | `8000` | Kong gateway server listening port |
| services.kong.service.ssl_port| `8443` | Kong gateway server SSL listening port |
| services.kong.admin.port | `8001` | Kong gateway admin server listening port |
| services.kong.admin.ssl_port | `8444` | Kong gateway admin server SSL listening port |
| services.apollo.service.port | `4000` | Apollo server listening port |

### AWS
`vars/aws.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| aws_region| `us-west-2` | AWS region. |
| aws_key_name | `secret` | AWS key name. |
| aws_instance_type | `t2.micro` | AWS EC2 instant type that you want to test on. |
| aws_image | `ami-0b28dfc7adc325ef4` | AWS AMI image ID |
| aws_group | `secret-sg` | |
| aws_vpc_subnet_id | `subnet-vpc_subnet_id` | AWS subnet ID |
| aws_access_key | `aws_access_key` | AWS access key |
| aws_secret_key | `aws_secret_key` | AWS secret key |
| provider.user | `ec2-user` | Username for SSH connection to generated instances. |
| provider.key_file | `./secret.pem` | Key file for SSH connection to generated instances. Should be the key file referenced in `aws_key_name`. |

### GCP
`vars/gcp.yml`

| Variable | Default | Comments |
| --------- | :---------: | --------- |
| gcp_project| `project` | GCP project. |
| gcp_region | `us-west1` | GCP region. |
| gcp_zone | `us-west1-a` | GCP zone. |
| gcp_auth_kind | `serviceaccount` | GCP authentication method |
| gcp_service_account_file | `./secret.json | GCP authentication file |
| gcp_machine_type | `e2-medium` | GCP compute instant type that you want to test on. |
| gcp_image | `projects/rhel-cloud/global/images/rhel-8-v20220303` | GCP image ID |
| provider.user | `user` | Username for SSH connection to generated instances. |
| provider.key_file | `./secret.pem` | Key file for SSH connection to generated instances. |
