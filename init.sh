#!/bin/bash

#docker-compose exec frappe bash -c "rm -r frappe-bench"
docker-compose exec frappe bash -c "cd .. && bench init frappe-bench --ignore-exist --skip-redis-config-generation"
docker-compose exec frappe bash -c "bench set-mariadb-host mariadb"
docker-compose exec frappe bash -c "tail -n+4 Procfile > tmp"
docker-compose exec frappe bash -c "mv tmp Procfile"
docker-compose exec frappe bash -c "cp sites/common_site_config.json.docker sites/common_site_config.json"
git clone https://github.com/Infozdrav/infozdrav.git ./frappe-bench/apps/infozdrav