#!/usr/bin/env bash

(cd rapirabooks && git clean -fdx && git pull)
mv .envrc .env
docker compose up --build -d --remove-orphans

start_time=$(date +%s)
end_time=$((start_time + 180))
while true; do
    current_time=$(date +%s)
    if [[ "$current_time" -ge "$end_time" ]]; then
        echo "Timeout reached! Exiting..."
        exit 1
    fi
    health_statuses=$(docker compose ps --services --quiet | xargs docker inspect --format='{{.State.Health.Status}}' | grep -v healthy)
    if [ -z "$health_statuses" ]; then
        break
    fi
    echo "Waiting for services to be healthy..."
    sleep 5
done

echo "All services are healthy!"
