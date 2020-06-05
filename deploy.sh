#!/usr/bin/env bash

cd ~
source ~/stackrc

#NOTE: For some reason this causes issues in RHOSP 15
#  -n /home/stack/templates/network_data.yaml \

#TODO
# Move Ceph stuff to use external implementations

time openstack overcloud deploy --templates \
  -r /home/stack/templates/roles_data.yaml \
  -e /home/stack/containers-prepare-parameter.yaml \
  -e /home/stack/templates/timezone.yaml \
  -e /home/stack/templates/cloudname.yaml \
  -e /home/stack/templates/inject-trust-anchor-hiera.yaml \
  -e /home/stack/templates/node-info.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-rgw.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/cinder-backup.yaml \
  -e /home/stack/templates/ceph-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/enable-swap.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-dvr-ha.yaml \
  -e /home/stack/templates/network-isolation.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/firstboot-environment.yaml \
  --timeout 120
