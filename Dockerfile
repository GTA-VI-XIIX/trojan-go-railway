FROM alpine:latest

RUN apk add --no-cache curl bash && \
    curl -L -o /trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip && \
    mkdir /trojan-go && \
    unzip /trojan-go.zip -d /trojan-go && \
    chmod +x /trojan-go/trojan-go

COPY entrypoint.sh /entrypoint.sh
COPY config /config

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]