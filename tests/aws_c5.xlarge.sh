ansible-playbook aws.playbook.yml -t standup -e '{ "aws_instance_type": "c5.xlarge", "test_services": [ "kong", "apollo" ] }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-1-vanilla" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-2-vanilla" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-3-vanilla" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-1-auth" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-2-auth" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-3-auth" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-1-analytics" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-2-analytics" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-3-analytics" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-1-auth-quota" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-2-auth-quota" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-3-auth-quota" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-1-rate-limiting" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-2-rate-limiting" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-3-rate-limiting" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-1-all" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-2-all" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "c5.xlarge-aws-3-all" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-1" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-2" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "c5.xlarge-aws-3" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0 }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.xlarge-aws-1" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.xlarge-aws-2" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "c5.xlarge-aws-3" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1 }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.xlarge-aws-1" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.xlarge-aws-2" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "c5.xlarge-aws-3" }'

ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2 }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.xlarge-aws-1" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.xlarge-aws-2" }'
ansible-playbook playbook.yml -i hosts/c5.xlarge-aws-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "c5.xlarge-aws-3" }'

ansible-playbook aws.playbook.yml -t cleanup -e '{ "aws_instance_type": "c5.xlarge", "test_services": [ "kong", "apollo" ] }'
