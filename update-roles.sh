#!/bin/bash
# update-roles.sh
# See: https://github.com/ansible/ansible/issues/6466#issuecomment-65454871
rm -rf roles/*
ansible-galaxy install -p roles -r requirements.yml -v
pushd roles
git clone git://github.com/jackdengtw/ansible-role-jenkins geerlingguy.jenkins
git clone git://github.com/jackdengtw/ansible-role-solita.jenkins solita.jenkins
popd
