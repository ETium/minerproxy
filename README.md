# minerproxy
vi /etc/minerproxy/config.yml
docker run --restart=always --network host -d -v /etc/minerproxy/config.yml:/etc/minerproxy/config.yml --name minerproxy quay.io/helios/minerproxy
