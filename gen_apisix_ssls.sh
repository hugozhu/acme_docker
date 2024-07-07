#!/bin/bash

update_apisix() {
	# generate json payload for apisix api
	cert=$(python3 -c "import sys; print(open(sys.argv[1]).read().strip().replace('\n', '\\\n'))" "$1.cer")
	key=$(python3 -c "import sys; print(open(sys.argv[1]).read().strip().replace('\n', '\\\n'))" "$1.key")
	id=$2
	domain=$1

	content=$( cat << EOF
	{
	    "cert": "$cert",
	    "key":  "$key",
	    "snis": ["hugozhu.site", "*.hugozhu.site", "*.go.hugozhu.site"]
	}
EOF
)

	tmp="hugozhu.site.json"
	echo $content > "$tmp"
}

update_apisix "./cert/hugozhu.site_ecc/hugozhu.site"
