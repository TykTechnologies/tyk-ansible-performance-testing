## AWS playbook
AWS playbook allows you to standup and teardown the infrastructure required to run the tests on AWS.

### Getting Started
Make sure to add the required AWS information in `vars/aws.yml`. You can find out more information about the following variables in the [variables documentation](/docs/variables.md#aws) page.

```
aws_region: us-west-2
aws_key_name: secret
aws_instance_type: c5.large
aws_image: ami-08970fb2e5767e3b8
aws_group: secret-sg
aws_vpc_subnet_id: subnet-vpc_subnet_id
aws_access_key: aws_access_key
aws_secret_key: aws_secret_key
provider:
  user: ec2-user
  key_file: ./secret.pem
```

### Example
```
ansible-playbook aws.playbook.yml -t standup -e '{ "aws_instance_type": "c5.large", "test_services": [ "tyk", "kong" ] }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ] }'
sudo ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c5.large-aws-1" }'
sudo ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c5.large-aws-2" }'
sudo ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c5.large-aws-3" }'
ansible-playbook aws.playbook.yml -t cleanup -e '{ "aws_instance_type": "c5.large", "test_services": [ "tyk", "kong" ] }'
```
