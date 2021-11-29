TIME=$(date '+%Y-%m-%d-%H-%M-%S')
<< parameters.time >>=$TIME

if [ "${STATUS}" -eq "1" ]; then
  STATUS="true"
else
  STATUS="false"
fi

_api_token=`eval echo "\$""${TOKEN}"`
# _api_token=`eval echo "\$${TOKEN}"`
_org=`eval echo "${ORGANIZATION}"`
_repo=`eval echo "${REPO}"`
_branch=`eval echo "${BRANCH}"`


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