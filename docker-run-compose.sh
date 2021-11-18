#!/bin/bash

docker stop cas_compose > /dev/null 2>&1
docker rm cas_compose > /dev/null 2>&1
image_tag=(`cat gradle.properties | grep "cas.version" | cut -d= -f2`)
docker run -d -p 8080:8080 -p 8443:8443 --name="cas_compose" cas-overlay-template_cas:latest
docker logs -f cas_compose