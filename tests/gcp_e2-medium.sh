ansible-playbook gcp.playbook.yml -t standup -e '{ "gcp_machine_type": "e2-medium", "test_services": [ "kong", "apollo" ] }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-1-vanilla" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-2-vanilla" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-3-vanilla" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-1-auth" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-2-auth" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-3-auth" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-1-analytics" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-2-analytics" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": true, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-3-analytics" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-1-auth-quota" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-2-auth-quota" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": false, "enable_quota": true, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-3-auth-quota" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-1-rate-limiting" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-2-rate-limiting" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-3-rate-limiting" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-1-all" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-2-all" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [], "enable_auth": true, "enable_analytics": true, "enable_quota": true, "enable_rate_limiting": true, "prefix": "e2-medium-gcp-3-all" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-1" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-2" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "e2-medium-gcp-3" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0 }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "e2-medium-gcp-1" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "e2-medium-gcp-2" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 0, "prefix": "e2-medium-gcp-3" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1 }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "e2-medium-gcp-1" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "e2-medium-gcp-2" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 1, "prefix": "e2-medium-gcp-3" }'

ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t install -t standup -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2 }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "e2-medium-gcp-1" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "e2-medium-gcp-2" }'
ansible-playbook playbook.yml -i hosts/e2-medium-gcp-hosts.yml -t test -e '{ "query_type": "STITCH", "test_services": [ "apollo" ], "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "query_depth": 2, "prefix": "e2-medium-gcp-3" }'

ansible-playbook gcp.playbook.yml -t cleanup -e '{ "gcp_machine_type": "e2-medium", "test_services": [ "kong", "apollo" ] }'
