# ansible

Personal playbook configuration for my development evironment.

## Ansible

```bash
# install ansible
pip install ansible

# dependencies for windows
pip install pywinrm
# yay -S python-pywinrm
```

## Create a new role

```bash
ansible-galaxy init ansible/roles/common
```

```bash
ansible-galaxy collection install community.docker

# ping all hosts
ansible all --key-file ~/.ssh/ansible -i inventory -m ping --user loneexile
## with ansible.cfg
# ansible all -m ping

# gather facts
ansible all -m gather_facts | grep ansible_distribution

# run playbook
ansible-playbook --ask-become-pass playbooks/main.yml --user loneexile

# run playbook with variables
ansible-playbook --ask-become-pass playbooks/main.yml --user loneexile -e "@variables.yml"

```

`import_playbook`: This directive is used to include another playbook at the top
level, essentially concatenating multiple playbooks into one. This is static and
does not support conditionals or loops

---

## SSH

```bash
# generate ssh key
ssh-keygen -t ed25519 -C "ansible"
# copy to remote host
ssh-copy-id -i ~/.ssh/ansible.pub user@192.168.1.1

# incase don't have openssh-server installed
sudo apt install openssh-server

# uncomment port 22
sudo vi /etc/ssh/sshd_config

sudo ufw allow 22
# sudo ufw allow ssh

sudo service ssh restart
# sudo systemctl status ssh

# check ip
# ip a

# e.g.
## ssh username@ip -p1337

## use nmap to scan network
sudo nmap -sn 192.168.1.0/24

## check what is using port 53
sudo lsof -i :53
## stop service
sudo systemctl stop servicename
# sudo systemctl stop systemd-resolved

sudo vi /etc/resolv.conf
# nameserver 1.1.1.1
```
