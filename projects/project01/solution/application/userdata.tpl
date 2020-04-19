#! /bin/bash
mkdir -p /etc/ecs
echo 'ECS_CLUSTER=${ecs_cluster_name}' >> /etc/ecs/ecs.config
echo 'ECS_ENABLE_SPOT_INSTANCE_DRAINING=true' >> /etc/ecs/ecs.config
