sudo docker run -d --restart always --name kong \
    --add-host=host.docker.internal:host-gateway \
    -e "KONG_DATABASE=off" \
    -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
    -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
    -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
    -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
    -e "KONG_DECLARATIVE_CONFIG=/usr/kconfig/filename.yml"\
    --mount type=bind,source="/home/ubuntu/kong/,target=/usr/kconfig/" \
    -p 9080:8000 \
    -p 9443:8443 \
    -p 9001:8001 \
    -p 9444:8444 \
    kong


sleep 5
#http :9001/config config=@invoice.dcl



