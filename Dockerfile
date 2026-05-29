FROM alpine:latest
RUN apk add --no-cache curl bash openssl
RUN MTG_URL=$(curl -s https://api.github.com/repos/9seconds/mtg/releases/latest | \
    grep "browser_download_url.*linux-amd64" | cut -d '"' -f 4) && \
    curl -sL "$MTG_URL" -o mtg.tar.gz && \
    tar xzf mtg.tar.gz && \
    mv mtg /usr/local/bin/
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 443
ENTRYPOINT ["/start.sh"]
