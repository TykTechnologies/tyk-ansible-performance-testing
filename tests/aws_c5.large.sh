ansible-playbook aws.playbook.yml -t standup -e '{ "aws_instance_type": "c5.large", "aws_image": "ami-08970fb2e5767e3b8", "test_services": [ "tyk", "kong", "apollo" ] }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-1-vanilla"vanilla", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-2-vanilla"vanilla", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-3-vanilla"vanilla", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-1-auth"auth", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-2-auth"auth", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-3-auth"auth", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-1-analytics"analytics", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-2-analytics"analytics", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.large-aws-3-analytics"analytics", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.large-aws-1-auth-quota"auth-quota", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.large-aws-2-auth-quota"auth-quota", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.large-aws-3-auth-quota"auth-quota", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.large-aws-1-rate-limiting"rate-limiting", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.large-aws-2-rate-limiting"rate-limiting", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk", "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.large-aws-3-rate-limiting"rate-limiting", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.large-aws-1-all"all", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.large-aws-2-all"all", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "tyk" ], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.large-aws-3-all"all", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0 }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.large-aws-1", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.large-aws-2", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.large-aws-3", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1 }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.large-aws-1", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.large-aws-2", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.large-aws-3", "load_test_duration": "5m" }'

ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2 }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.large-aws-1", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.large-aws-2", "load_test_duration": "5m" }'
ansible-playbook playbook.yml -i hosts/c5.large-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "tyk", "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.large-aws-3", "load_test_duration": "5m" }'

ansible-playbook aws.playbook.yml -t cleanup -e '{ "aws_instance_type": "c5.large", "test_services": [ "tyk", "kong", "apollo" ] }'
