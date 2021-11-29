# _time=$(date '+%Y-%m-%d-%H-%M-%S')
# echo "export TIME=`echo ${_time}`" >> $BASH_ENV

TIME=$(date '+%Y-%m-%d-%H-%M-%S')

if [ "${STATUS}" -eq "1" ]; then
  STATUS="true"
else
  STATUS="false"
fi

### CHECK ENV
[ "${TOKEN::1}" == '$' ] && TOKEN=`eval echo ${TOKEN}`
[ "${ORGANIZATION::1}" == '$' ] && ORGANIZATION=`eval echo ${ORGANIZATION}`
[ "${REPO::1}" == '$' ] && REPO=`eval echo ${REPO}`
[ "${BRANCH::1}" == '$' ] && BRANCH=`eval echo ${BRANCH}`
[ "${TEXT::1}" == '$' ] && TEXT=`eval echo ${TEXT}`
[ "${APP::1}" == '$' ] && APP=`eval echo ${APP}`


########### debug
echo "--- debug ---"
cat << EOS
{
"api_token": "${TOKEN}",
"organization": "${ORGANIZATION}",
"repo": "${REPO}",
"app": "${APP}",
"branch": "${BRANCH}",
"status": "${STATUS}",
`[ -n "${TEXT}" ] && \
cat << EOF
"txt": "${TEXT}",
EOF`
`[ -n "${COLOR}" ] && \
cat << EOF
"color": "${COLOR}",
EOF`
"update": "${TIME}"
}
EOS
env
echo "--- debug ---"

HTTP_RESPONSE=$(curl -o /dev/null --silent --write-out '%{http_code}\n' -X POST -H "Content-Type: application/json" \
https://badges.rhems-japan.com/api-update-badge \
-d @- <<EOS
{
"api_token": "${TOKEN}",
"organization": "${ORGANIZATION}",
"repo": "${REPO}",
"app": "${APP}",
"branch": "${BRANCH}",
"status": "${STATUS}",
`[ -n "${TEXT}" ] && \
cat << EOF
"txt": "${TEXT}",
EOF`
`[ -n "${COLOR}" ] && \
cat << EOF
"color": "${COLOR}",
EOF`
"update": "${TIME}"
}
EOS
)

# echo "HTTP_RESPONSE=${HTTP_RESPONSE}"
# Responses other than 200 end with an error.
# [ ${HTTP_RESPONSE} -ne '200' ] && exit 1

if [ ${HTTP_RESPONSE} -ne '200' ]; then
  echo 'not 200'
  exit 1
fi
