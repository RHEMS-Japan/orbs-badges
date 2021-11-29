TIME=$(date '+%Y-%m-%d-%H-%M-%S')

if [ "${STATUS}" -eq "1" ]; then
  STATUS="true"
else
  STATUS="false"
fi

API_TOKEN=`eval echo "\$${TOKEN}"`

echo "API_TOKEN ${TOKEN}"
echo "ORGANIZATION ${ORGANIZATION}"
echo "REPO ${REPO}"
echo "APP ${APP}"
echo "BRANCH ${BRANCH}"
echo "STATUS ${STATUS}"
echo "COLOR ${COLOR}"
echo "TEXT ${TEXT}"
echo $TIME

curl -X POST -H "Content-Type: application/json" \
https://badges.rhems-japan.com/api-update-badge \
-d "{\"api_token\": \"${API_TOKEN}\",
\"organization\": \"${ORGANIZATION}\",
\"repo\": \"${REPO}\",
\"app\": \"${APP}\",
\"branch\": \"${BRANCH}\",
\"status\": \"${STATUS}\",
$([ -n "${TEXT}" ] && \
cat << EOF
"txt": "${TEXT}",
EOF)
$([ -n "${COLOR}" ] && \
cat << EOF
"color": "${COLOR}",
EOF)
\"update\": \"${TIME}\"}"


# curl -X POST -H "Content-Type: application/json" \
#   https://badges.rhems-japan.com/api-update-badge \
#   -d "{\"api_token\": \"${API_TOKEN}\",
#                 \"organization\": \"${ORGANIZATION}\",
#                 \"repo\": \"${REPO}\",
#                 \"app\": \"${APP}\",
#                 \"branch\": \"${BRANCH}\",
#                 \"status\": \"${STATUS}\",
#                 \"color\": \"${COLOR}\",
#                 \"txt\": \"${TEXT}\",
#                 \"update\": \"${TIME}\"}"