#!/usr/bin/env bash

if [[ "$(id -u)" -eq 0 ]]; then
  mkdir -p /workspaces/.tailscale
    /usr/sbin/tailscaled \
    --tun=userspace-networking \
    --socks5-server=localhost:1055 \
    --outbound-http-proxy-listen=localhost:1055 &

elif command -v sudo > /dev/null; then
  sudo --non-interactive mkdir -p /workspaces/.tailscale
    sudo --non-interactive \
    /usr/sbin/tailscaled \
    --tun=userspace-networking \
    --socks5-server=localhost:1055 \
    --outbound-http-proxy-listen=localhost:1055 &

else
  >&2 echo "tailscaled could not start as root. "
fi
