# ansible

Personal playbook configuration for my development evironment.

```bash

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

```bash
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
```
