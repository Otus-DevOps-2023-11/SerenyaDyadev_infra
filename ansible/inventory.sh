#!/bin/bash

LIST=$(yc compute instance list --format json)
LIST_LENGTH=$(echo $LIST | jq 'length')
IP_LIST=$(echo $LIST | jq 'map(.network_interfaces[].primary_v4_address.one_to_one_nat.address)')
HOSTS_LIST=$( echo $LIST | jq 'map(.name)')
TAGS_LIST=$( echo $LIST | jq 'map(.labels.tags)')

if [ "$1" == "--list" ] ; then
cat<<EOF
{
    "_meta": {
        "hostvars": {
            $(echo $HOSTS_LIST | jq '.[0]'): {
                "ansible_host": $(echo $IP_LIST | jq '.[0]')
            },
            $(echo $HOSTS_LIST | jq '.[1]'): {
                "ansible_host": $(echo $IP_LIST | jq '.[1]')
            }
        }
    },
    "all": {
        "children": [
            "ungrouped",
            $(echo $TAGS_LIST | jq '.[0]'),
            $(echo $TAGS_LIST | jq '.[1]')
        ]
    },
    $(echo $TAGS_LIST | jq '.[0]'): {
        "hosts": [
            $(echo $HOSTS_LIST | jq '.[0]')
        ]
    },
    $(echo $TAGS_LIST | jq '.[1]'): {
        "hosts": [
            $(echo $HOSTS_LIST | jq '.[1]')
        ]
    }
}
EOF
elif [ "$1" == "--host" ]; then
  echo '{"_meta": {"hostvars": {}}}'
else
  echo "{ }"
fi
