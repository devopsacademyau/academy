#! /bin/bash
mkdir -p /etc/ecs
echo 'ECS_CLUSTER=${ecs_cluster_name}' >> /etc/ecs/ecs.config
mkdir -p /mnt/efs
mount -t efs -o tls ${efs_id}:/ /mnt/efs
