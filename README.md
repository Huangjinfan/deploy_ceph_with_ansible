# deploy_ceph_with_ansible
This code contains some of ansible script to deploy ceph in cluster. It is suitable for deploy ceph in real enviroment also as virtual machine. This script was successful tested in fedora23 and use btrfs as the back storage.
## Requirment

### SSH without password

```
ssh-copy-id root@{dest node ip}
```

### Install ansible

```
dnf install ansible
```


### Edit host.txt and hosts

- host.txt is used to ansible to identify **ceph mon**, **ceph osd**, **ceph mds**, **ceph client**.


### Install Ceph

```
ansible-playbook -i host.txt software_install.yml
```

### Edit ceph.conf and hosts, then copy to cluster


- hosts will be copy in **/etc/hosts**
- ceph.conf will be copy in **/etc/ceph/ceph.conf"**

```
ansible-playbook -i host.txt copy_conf.yml
```


### Install Ceph Monitor

```
ansible-playbook -i host.txt mon_install.yml
```

### Install Ceph OSD

You need to edit map.txt to sure the relation between **osd-id** and **host ip**
```
ansible-playbook -i host.txt osd_install.yml
```

### Install Ceph MDS
```
ansible-playbook -i host.txt new_fs.yml
```

```
ansible-playbook -i host.txt mds_install.yml
```

### Other work

#### Restart service

```
ansible-playbook -i host.txt restart_service.yml
```

#### Clean the cluster but not uninstall ceph

```
ansible-playbook -i host.txt clean_ceph.yml
```
