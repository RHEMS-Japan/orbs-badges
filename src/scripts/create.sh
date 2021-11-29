TIME=$(date '+%Y-%m-%d-%H-%M-%S')

if [ "${STATUS}" -eq "1" ]; then
  STATUS="true"
else
  STATUS="false"
fi

echo "${TOKEN}"

_api_token=`eval echo "\$${TOKEN}"`
_org=`eval echo "${ORGANIZATION}"`
_repo=`eval echo "${REPO}"`
_branch=`eval echo "${BRANCH}"`

echo "API_TOKEN ${_api_token}"
echo "ORGANIZATION ${_org}"
echo "REPO ${_repo}"
echo "APP ${APP}"
echo "BRANCH ${_branch}"
echo "STATUS ${STATUS}"
echo "COLOR ${COLOR}"
echo "TEXT ${TEXT}"
echo $TIME

curl -X POST -H "Content-Type: application/json" \
https://badges.rhems-japan.com/api-update-badge \
-d "{\"api_token\": \"${_api_token}\",
\"organization\": \"${_org}\",
\"repo\": \"${_repo}\",
\"app\": \"${APP}\",
\"branch\": \"${_branch}\",
\"status\": \"${STATUS}\",
$([ -n "${TEXT}" ] && \
cat << EOF
"txt": "${TEXT}",
EOF
)
$([ -n "${COLOR}" ] && \
cat << EOF
"color": "${COLOR}",
EOF
)
\"update\": \"${TIME}\"}"


# curl -X POST -H "Content-Type: application/json" \
#           https://badges.rhems-japan.com/api-update-badge \
#            -d "{\"api_token\": \"${API_TOKEN}\",
#                 \"organization\": \"${ORGANIZATION}\",
#                 \"repo\": \"${REPO}\",
#                 \"app\": \"${APP}\",
#                 \"branch\": \"${BRANCH}\",
#                 \"status\": \"${STATUS}\",
#                 \"color\": \"${COLOR}\",
#                 \"txt\": \"${TEXT}\",
#                 \"update\": \"${TIME}\"}"