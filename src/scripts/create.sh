_time=$(date '+%Y-%m-%d-%H-%M-%S')
echo "export TIME=`echo ${_time}`" >> $BASH_ENV

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
_txt=`eval echo "${TEXT}"`


HTTP_RESPONSE=$(curl -o /dev/null --silent --write-out '%{http_code}\n' -X POST -H "Content-Type: application/json" \
https://badges.rhems-japan.com/api-update-badge \
-d "{\"api_token\": \"${_api_token}\",
\"organization\": \"${ORGANIZATION}\",
\"repo\": \"${REPO}\",
\"app\": \"${APP}\",
\"branch\": \"${BRANCH}\",
\"status\": \"${STATUS}\",
$([ -n "${_txt}" ] && \
     cat << EOF
     "txt": "${_txt}",
EOF
)
$([ -n "${COLOR}" ] && \
     cat << EOF
     "color": "${COLOR}",
EOF
)
\"update\": \"${TIME}\"}")
echo "HTTP_RESPONSE=${HTTP_RESPONSE}"
# Responses other than 200 end with an error.
[ ${HTTP_RESPONSE} -ne 200 ] && exit 1

# curl -X POST -H "Content-Type: application/json" \
# https://badges.rhems-japan.com/api-update-badge \
# -d "{\"api_token\": \"${_api_token}\",
# \"organization\": \"${_org}\",
# \"repo\": \"${_repo}\",
# \"app\": \"${APP}\",
# \"branch\": \"${_branch}\",
# \"status\": \"${STATUS}\",
# $([ -n "${_txt}" ] && \
# cat << EOF
# "txt": "${_txt}",
# EOF
# )
# $([ -n "${COLOR}" ] && \
# cat << EOF
# "color": "${COLOR}",
# EOF
# )
# \"update\": \"${_time}\"}"

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