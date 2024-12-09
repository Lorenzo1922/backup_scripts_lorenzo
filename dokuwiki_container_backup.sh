#!/bin/bash
####################################
#
# Backup dokuwiki folder present into the docker dokuwiki container.
#
####################################
#docker container ps -a | grep dokuwiki           and keep note of the container name
docker cp dokucont20241124updated:/var/www/html/dokuwiki /opt/docker/dokuwiki_web_server_folder_backups
mv /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F)
tar -zcf /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F).tar.gz /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F)
scp /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F).tar.gz backupi@192.168.1.113:/opt/docker/dokuwiki_web_server_folder_backups/
#scp -P 8822 /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F).tar.gz debian@51.38.81.147:/opt/docker/images_backups/
rm -rf /opt/docker/dokuwiki_web_server_folder_backups/dokuwiki_backup_web_folder_$(date +%F)
curl "https://ezalert.me/v1/sendAlert?apikey=330-67948613361bcfa79a38f7&text=the+dokuwiki+web+server+folder+has_been+backup+successfully"
