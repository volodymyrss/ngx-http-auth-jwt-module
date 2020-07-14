

function genkey {
    openssl rand -hex 32 > secret
}

function configkey {
    < resources/template-oda-jwt-nginx.conf awk '{ if ($0~/auth_jwt_key +".*?"\;/) {print "    "$1, "                \"'$(cat secret)'\";"} else print;} ' > resources/oda-jwt-nginx.conf
}

$@
