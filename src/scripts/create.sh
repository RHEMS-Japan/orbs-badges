TIME=$(date '+%Y-%m-%d-%H-%M-%S')

if [ "${STATUS}" -eq "1" ]; then
  STATUS="true"
else
  STATUS="false"
fi

echo "[before]API_TOKEN ${API_TOKEN}"
echo "[before]ORGANIZATION ${ORGANIZATION}"
echo "[before]REPO ${REPO}"
echo "[before]APP ${APP}"
echo "[before]BRANCH ${BRANCH}"
echo "[before]STATUS ${STATUS}"
echo "[before]COLOR ${COLOR}"
echo "[before]TEXT ${TEXT}"

API_TOKEN=$(eval echo "\$${API_TOKEN}")
# ORGANIZATION=$(eval echo "\$${ORGANIZATION}")
REPO=$(eval echo "${REPO}")
# APP=$(eval echo "\$${APP}")
BRANCH=$(eval echo "${BRANCH}")
# STATUS=$(eval echo "\$$STATUS")
# COLOR=$(eval echo "\$$COLOR")
TEXT=$(eval echo "${TEXT}")

echo "[after]API_TOKEN ${API_TOKEN}"
echo "[after]ORGANIZATION ${ORGANIZATION}"
echo "[after]REPO ${REPO}"
echo "[after]APP ${APP}"
echo "[after]BRANCH ${BRANCH}"
echo "[after]STATUS ${STATUS}"
echo "[after]COLOR ${COLOR}"
echo "[after]TEXT ${TEXT}"

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