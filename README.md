# README

## Description

1. Run docker-compose to start the control, node1 and node2
```bash
make up
```
3. Enter in the control container
```bash
make control
```

4. Copy the ssh key to the nodes, the password is Password123
```bash
ssh-copy-id root@node1
ssh-copy-id root@node2
```

5. Execute ping to the nodes to check if the connection is working
```bash
cd /root/ansible
ansible -i hosts all -m ping
```

## Ansible commands in the control container

- Install requirements
```bash
ansible-galaxy install -r requirements.yml
```

- Run playbooks
```bash
ansible-playbook -i inventory/docker_nodes playbooks/playbook_name.yaml
```