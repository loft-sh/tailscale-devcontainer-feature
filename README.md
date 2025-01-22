# tailscale-devcontainer-feature

Devcontainer feature to enable userspace tailscale networking. The feature first installs tailscaled and the CLI client and runs tailscaled with the userpsace networking flags defined in https://tailscale.com/kb/1112/userspace-networking.

To install simply add the following to your .devcontainer.json

```
"features": {
  "ghcr.io/tailscale/codespace/tailscale": {
    "version": "latest"
  }
}
```

Once the container is running you can run tailscale commands as usual, such as

```
tailscale up --auth-key=$TS_AUTHKEY --login-server=$TS_AUTH_URL --hostname $HOSTNAME
```