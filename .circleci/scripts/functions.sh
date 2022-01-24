#!/bin/bash

[ -n "${CIRCLE_TAG}" ] && \
echo "export CIRCLE_BRANCH=`echo ${CIRCLE_TAG} | sed "s#/$(echo ${CIRCLE_TAG} | awk -F "/" '{ print $(NF-1) }')/$(echo ${CIRCLE_TAG} | awk -F "/" '{ print $NF }')##"`" >> $BASH_ENV
echo "${CIRCLE_BRANCH}"