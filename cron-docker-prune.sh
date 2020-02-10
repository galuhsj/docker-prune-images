FILE_NAME="cron-docker-prune-log.txt"
[ ! -e "./$FILE_NAME" ] && touch $FILE_NAME
date +"%Y-%m-%d %T" >> $FILE_NAME
echo "Docker prune is running" >> $FILE_NAME
RESULT=$(echo "y" | docker image prune -a)
echo "$RESULT" | grep -o 'Total reclaimed space:.*' >> $FILE_NAME
echo -e "Docker prune is done\n" >> $FILE_NAME
