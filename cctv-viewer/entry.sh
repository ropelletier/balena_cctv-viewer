#!/bin/bash 

rm -Rf /$GIT_REPO

git clone https://$GKEY@github.com/ropelletier/$GIT_REPO.git

bash /$GIT_REPO/update.sh

chmod +x /$GIT_REPO/$RUN_FILE.sh

while [ ! -e /tmp/.X11-unix/X${DISPLAY#*:} ]; do sleep 0.5; done

echo ${DISPLAY#*:}

x11vnc -display :1 -forever -nopw &

bash /$GIT_REPO/$RUN_FILE

