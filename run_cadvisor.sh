sudo docker run -d --restart always  -p 8080:8080 -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys:ro -v /var/lib/docker/:/var/lib/docker:ro --name=cadvisor google/cadvisor:latest
