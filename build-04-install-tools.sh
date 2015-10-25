#!/bin/bash
set -e
set -x

RABBITMQADMIN_URL="https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v3_5_2/bin/rabbitmqadmin"
RABBITMQADMIN_SHA="eddb93f835a90bb3a1e349862f8aa3451389cf3ff6d5bf05835637de6e5f12fc"

TMPFILE=$(mktemp /tmp/rabbitmqadmin.XXXXXX)

wget $RABBITMQADMIN_URL -O $TMPFILE

if [[ "$(sha256sum $TMPFILE | awk '{ print $1 }')" = "${RABBITMQADMIN_SHA}" ]]; then
	chmod +x $TMPFILE
	mv $TMPFILE /usr/local/bin/rabbitmqadmin
	rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin
else
	rm $TMPFILE
fi
