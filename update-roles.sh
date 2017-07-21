#!/bin/bash
# update-roles.sh
# See: https://github.com/ansible/ansible/issues/6466#issuecomment-65454871
rm -rf roles/*
ansible-galaxy install -p roles -r requirements.yml -v
pushd roles
git clone https://github.com/jackdengtw/ansible-role-jenkins geerlingguy.jenkins
git clone https://github.com/jackdengtw/ansible-role-solita.jenkins solita.jenkins
git clone git@git.jd.com/cloudtest/jenkins_utils jenkins.utils
popd
