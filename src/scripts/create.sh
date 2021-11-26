TIME=$(date '+%Y-%m-%d-%H-%M-%S')

if [ "${STATUS}" -eq 1 ] ; then
     ${STATUS} = "true"
else
     ${STATUS} = "false"
fi


echo "[before]API_TOKEN ${API_TOKEN}"
echo "[before]ORGANIZATION ${ORGANIZATION}"
echo "[before]REPO ${REPO}"
echo "[before]APP ${APP}"
echo "[before]BRANCH ${BRANCH}"
echo "[before]STATUS ${STATUS}"
echo "[before]COLOR ${COLOR}"
echo "[before]TEXT ${TEXT}"

export _api_token=$(eval echo "\$$API_TOKEN")
# ORGANIZATION=$(eval echo "\$${ORGANIZATION}")
export _repo=$(eval echo "\$$REPO")
# APP=$(eval echo "\$${APP}")
export _branch=$(eval echo "\$$BRANCH")
STATUS=$(eval echo "\$$STATUS")
# COLOR=$(eval echo "\$$COLOR")
TEXT=$(eval echo "\$$TEXT")

echo "[after]API_TOKEN ${_api_token}"
echo "[after]ORGANIZATION ${ORGANIZATION}"
echo "[after]REPO ${_repo}"
echo "[after]APP ${APP}"
echo "[after]BRANCH ${_branch}"
echo "[after]STATUS ${STATUS}"
echo "[after]COLOR ${COLOR}"
echo "[after]TEXT ${TEXT}"

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