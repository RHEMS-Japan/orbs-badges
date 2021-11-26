TIME=$(date '+%Y-%m-%d-%H-%M-%S')

echo "[before] ${API_TOKEN}"

_api_token=$(eval echo "\$$API_TOKEN")
ORGANIZATION=$(eval echo "\$${ORGANIZATION}")
REPO=$(eval echo "\$${REPO}")
APP=$(eval echo "\$${APP}")
BRANCH=$(eval echo "\$${BRANCH}")
STATUS=$(eval echo "\$${STATUS}")
COLOR=$(eval echo "\$${COLOR}")
TEXT=$(eval echo "\$${TEXT}")

echo "[after] ${_api_token}"

curl -X POST -H "Content-Type: application/json" \
          https://badges.rhems-japan.com/api-update-badge \
           -d "{\"api_token\": \"${_api_token}\",
                \"organization\": \"${ORGANIZATION}\",
                \"repo\": \"${REPO}\",
                \"app\": \"${APP}\",
                \"branch\": \"${BRANCH}\",
                \"status\": \"${STATUS}\",
                \"color\": \"${COLOR}\",
                \"txt\": \"${TEXT}\",
                \"update\": \"${TIME}\"}"