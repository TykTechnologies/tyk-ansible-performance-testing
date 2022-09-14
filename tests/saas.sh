# Freemium
ansible-playbook playbook.yml -t install -t standup -t saas -i saas/freemium-hosts.yml -e '{ "query_type": "REST", "prefix": "freemium", "test_services": [] }'
# Freemium Edge Gateway
ansible-playbook playbook.yml -t test -t saas -i saas/freemium-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "freemium-edge-1", "api_url": "https://innocent-gauge-gw.aws-euw1.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/freemium-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "freemium-edge-2", "api_url": "https://innocent-gauge-gw.aws-euw1.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/freemium-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "freemium-edge-3", "api_url": "https://innocent-gauge-gw.aws-euw1.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'

# Trial
ansible-playbook playbook.yml -t install -t standup -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "prefix": "trial", "test_services": [] }'
# Trial Edge Gateway
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-edge-1", "api_url": "https://accurate-letter-gw.aws-usw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-edge-2", "api_url": "https://accurate-letter-gw.aws-usw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-edge-3", "api_url": "https://accurate-letter-gw.aws-usw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
# Trial Hybrid Gateway
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-hybrid-1", "api_url": "http://ec2-54-200-9-157.us-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-hybrid-2", "api_url": "http://ec2-54-200-9-157.us-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/trial-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "trial-hybrid-3", "api_url": "http://ec2-54-200-9-157.us-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'

# Paid
ansible-playbook playbook.yml -t install -t standup -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "prefix": "paid", "test_services": [] }'
# Paid Edge Gateway
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-edge-1", "api_url": "https://worthy-pet-gw.aws-euw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-edge-2", "api_url": "https://worthy-pet-gw.aws-euw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-edge-3", "api_url": "https://worthy-pet-gw.aws-euw2.cloud-ara.tyk.io/api/", "test_services": [], , "load_test_duration": "5m" }'
# Paid Hybrid Gateway
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-hybrid-1", "api_url": "http://ec2-18-133-180-111.eu-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-hybrid-2", "api_url": "http://ec2-18-133-180-111.eu-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'
ansible-playbook playbook.yml -t test -t saas -i saas/paid-hosts.yml -e '{ "query_type": "REST", "enable_auth": false, "enable_analytics": false, "enable_quota": false, "enable_rate_limiting": false, "prefix": "paid-hybrid-3", "api_url": "http://ec2-18-133-180-111.eu-west-2.compute.amazonaws.com:8080/api/", "test_services": [], , "load_test_duration": "5m" }'

RScript ./analyze.r \
  "freemium-edge,trial-edge,paid-edge" \
  "saas" \
  "tyk" \
  "1" \
  "Cores" \
  "1" \
  "Tyk SAAS Teirs - Edge -" \
  "Freemium,Trial,Paid" \
  "bar"

RScript ./analyze.r \
  "trial-hybrid,paid-hybrid" \
  "saas" \
  "tyk" \
  "1" \
  "Cores" \
  "1" \
  "Tyk SAAS Teirs - Hybrid" \
  "Trial,Paid" \
  "bar"
