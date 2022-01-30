# minerproxy
https://github.com/Char1esOrz/minerProxy

vi /etc/minerproxy/config.yml

docker run --restart=always --network host -d -v /etc/minerproxy/config.yml:/etc/minerproxy/config.yml --name minerproxy dockerinstyle/minerproxy

Update 4.0.0T9 push 
