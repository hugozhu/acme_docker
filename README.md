# acme_docker
docker deployment for auto SSLs

```
docker-compose up -d
docker exec acme acme.sh --set-default-ca --server letsencrypt
docker exec acme acme.sh --issue --dns dns_dp  -d hugozhu.site -d *.hugozhu.site -d *.go.hugozhu.site
docker-compose down

cp hugozhu.site.json ../pi-apisix-gateway/apisix_conf/ssls/1-hugozhu.site.json

cd ../pi-apisix-gateway
./config.sh hugozhu.site
cd -

```
