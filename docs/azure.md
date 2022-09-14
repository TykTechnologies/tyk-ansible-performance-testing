## Azure playbook
Azure playbook allows you to standup and teardown the infrastructure required to run the tests on Azure.

pip install -r requirements-azure.tx

### Getting Started
Make sure to add the required Azure information in `vars/azure.yml`. You can find out more information about the following variables in the [variables documentation](/docs/variables.md#azure) page.

```
azure_vm_size: Standard_F2s_v2
azure_location: westus
azure_image:
  offer: RHEL
  publisher: RedHat
  sku: '8_6'
  version: '8.6.2022070801'
azure_ssh_public_key: "public_key"
provider:
  user: azureuser
  key_file: ./secret.pem
```

#### Azure CLI
You must login to Azure CLI before using this playbook. You can do so by running the following command:

```
az login
```

Here are the [official azure docs](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) for installing the Azure CLI.

#### Ansible Azure libraries
If you run into issues launching ansible you're probably missing the azure ansible libraries you can download these dependencies by running the following command:

```
pip install -r requirements-azure.txt
```

### Example
```
ansible-playbook azure.playbook.yml -t standup -e '{ "azure_vm_size": "Standard_F2s_v2", "test_services": [ "kong" ] }'
ansible-playbook playbook.yml -i hosts/Standard_F2s_v2-azure-hosts.yml -t install -t standup -e '{ "query_type": "REST", "test_services": [ "kong" ] }'
sudo ansible-playbook playbook.yml -i hosts/Standard_F2s_v2-azure-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "prefix": "Standard_F2s_v2-azure-1" }'
sudo ansible-playbook playbook.yml -i hosts/Standard_F2s_v2-azure-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "prefix": "Standard_F2s_v2-azure-2" }'
sudo ansible-playbook playbook.yml -i hosts/Standard_F2s_v2-azure-hosts.yml -t test -e '{ "query_type": "REST", "test_services": [ "kong" ], "prefix": "Standard_F2s_v2-azure-3" }'
ansible-playbook azure.playbook.yml -t cleanup -e '{ "azure_vm_size": "Standard_F2s_v2", "test_services": [ "kong" ] }'
```

