#! /bin/bash


## docker run: sudo docker run -it -p 3000:3000 --link dockerhackmd_hackmdPostgres_1:hackmdPostgres wc/hackmd:ver3 /bin/bash -c "dockerize -wait tcp://hackmdPostgres:5432 -timeout 30s /hackmd/docker-entrypoint.sh"
echo "[HackMD] Start database ..."
sudo docker start dockerhackmd_hackmdPostgres_1
echo "[HackMD] Start server ..."
sleep 1
sudo docker start hackmd
echo "done! Using \"sudo docker ps\" to check"



