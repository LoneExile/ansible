#!/usr/bin/env bash

if ! command -v expect &> /dev/null; then
    echo "Error: expect is not installed. Please install it and try again."
    exit 1
fi

read -p "Please enter the hostname (user): " hostname

read -p "Do all servers have the same password? (y/n): " same_password

if [ "$same_password" == "y" ]; then
    read -s -p "Please enter the password: " password
    echo
fi

INVENTORY_FILE="../inventory/hosts"

for ip in $(awk '/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ {print $1}' $INVENTORY_FILE); do
    if [ "$same_password" == "yes" ]; then
        # shellcheck disable=2034
        EXPECT_OUTPUT=$(expect <<EOF
        set timeout 10
        spawn ssh-copy-id -i $HOME/.ssh/ansible.pub ${hostname}@${ip}
        expect {
            "password:" {
                send "$password\r"
                expect eof
            }
            "No such file or directory" {
                exit 1
            }
            timeout {
                exit 1
            }
        }
EOF
        )
        if [ $? -ne 0 ]; then
            echo "Error occurred while copying SSH key to ${hostname}@${ip}. Exiting."
            exit 1
        else
            echo "SSH key successfully copied to ${hostname}@${ip}."
        fi
    else
        # ssh-copy-id -i $HOME/.ssh/id_rsa.pub ${hostname}@${ip}
        ssh-copy-id -i "$HOME/.ssh/ansible.pub" "${hostname}@${ip}"
    fi
done
