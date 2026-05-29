#!/bin/sh
if [ -z "$SECRET" ]; then
  SECRET=$(openssl rand -hex 16)
fi
echo "========================================="
echo "MTProto Proxy Secret: $SECRET"
echo "========================================="
cat > /tmp/proxy.toml <<CFG
secret = "$SECRET"
bind-to = "0.0.0.0:443"
CFG
exec mtg run /tmp/proxy.toml
