FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev

        
RUN apt-get autoremove -y; apt-get clean; rm -rf /var/lib/apt/lists/*; rm /var/log/alternatives.log /var/log/apt/*; rm /var/log/* -r;

#COPY BasicUsageEnvironment /BasicUsageEnvironment
#COPY groupsock /groupsock
#COPY liveMedia /liveMedia
#COPY UsageEnvironment /UsageEnvironment
COPY main /main

#ENV product_id="00:1D:94:11:22:33"

ADD ./init_script.sh /init_script.sh

ENTRYPOINT ["/init_script.sh"]
