#!/bin/bash
# Restore script to deploy the latest commit

LATEST_COMMIT=$(tail -1 ~/simple-web-deployment-pipeline/script/version_history.txt)

if [ -z "$LATEST_COMMIT" ]; then
    echo "Error: No commit found in version history"
    exit 1
fi

echo "Restoring to latest commit: $LATEST_COMMIT"
docker stop web-app 2>/dev/null || true
docker rm web-app 2>/dev/null || true 
docker run -d \
    --name web-app \
    --restart unless-stopped \
    -p 8080:5000 \
    web-app:"$LATEST_COMMIT"

if [ $? -eq 0 ]; then
    echo "Restore successful"
else
    echo "Error: Restore failed"
    exit 1
fi


