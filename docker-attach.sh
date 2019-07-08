id=`docker ps -aqf "name=ingest-wiki_elk_1"`
docker exec -it $id /bin/bash