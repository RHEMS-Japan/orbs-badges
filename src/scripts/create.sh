TIME=$(date '+%Y-%m-%d-%H-%M-%S')
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