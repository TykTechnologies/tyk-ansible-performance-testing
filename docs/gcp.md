## GCP playbook
GCP playbook allows you to standup and teardown the infrastructure required to run the tests on GCP.

### Getting Started
Make sure to add the required GCP information in `vars/gcp.yml`. You can find out more information about the following variables in the [variables documentation](/docs/variables.md#gcp) page.

```
gcp_project: project
gcp_region: us-central1
gcp_zone: us-central1-a
gcp_auth_kind: serviceaccount
gcp_service_account_file: ./secret.json
gcp_machine_type: c2d-standard-2
gcp_image: projects/rhel-cloud/global/images/rhel-8-v20220719
provider:
  user: user
  key_file: ./secret.pem
```

### Example
```
ansible-playbook gcp.playbook.yml -t standup -e '{ "gcp_machine_type": "c2d-standard-2", "test_services": [ "tyk", "kong" ] }'
ansible-playbook playbook.yml -i hosts/c2d-standard-2-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ] }'
sudo ansible-playbook playbook.yml -i hosts/c2d-standard-2-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c2d-standard-2-gcp-1" }'
sudo ansible-playbook playbook.yml -i hosts/c2d-standard-2-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c2d-standard-2-gcp-2" }'
sudo ansible-playbook playbook.yml -i hosts/c2d-standard-2-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "prefix": "c2d-standard-2-gcp-3" }'
ansible-playbook gcp.playbook.yml -t cleanup -e '{ "gcp_machine_type": "c2d-standard-2", "test_services": [ "tyk", "kong" ] }'
```

