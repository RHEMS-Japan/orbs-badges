TIME=$(date '+%Y-%m-%d-%H-%M-%S')

echo "[before] ${API_TOKEN}"

API_TOKEN=$(eval echo "\$${API_TOKEN}")
ORGANIZATION=$(eval echo "\$${ORGANIZATION}")
REPO=$(eval echo "\$${REPO}")
APP=$(eval echo "\$${APP}")
BRANCH=$(eval echo "\$${BRANCH}")
STATUS=$(eval echo "\$${STATUS}")
COLOR=$(eval echo "\$${COLOR}")
TEXT=$(eval echo "\$${TEXT}")

echo "[after] ${API_TOKEN}"

curl -X POST -H "Content-Type: application/json" \
          https://badges.rhems-japan.com/api-update-badge \
           -d "{\"api_token\": \"${API_TOKEN}\",
                \"organization\": \"${ORGANIZATION}\",
                \"repo\": \"${REPO}\",
                \"app\": \"${APP}\",
                \"branch\": \"${BRANCH}\",
                \"status\": \"${STATUS}\",
                \"color\": \"${COLOR}\",
                \"txt\": \"${TEXT}\",
                \"update\": \"${TIME}\"}"