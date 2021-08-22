FROM ubuntu:18.04

RUN apt update &&\
    apt -y upgrade &&\
    apt -y install iproute2 iputils-ping traceroute tcpdump dnsmasq python3 curl wget gawk dnsutils procps
