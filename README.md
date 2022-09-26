# nGrok

nGrok (https://ngrok.com/) is a service that allows you to send live code to a web address for others to view

this package is a set of tools to make it easy for an instructor to install, authorize, and get going in ngrok

# prerequisites

the package assumes that you have:
- installed a program manager for you computer (homebrew for mac, Chocolatey for Windows, Apt for linux)
- a ngrok subscription and associated authorization token
- a custom domain (e.g., hosted by google) set up according to https://ngrok.com/docs/guides/how-to-set-up-a-custom-domain


# functions

install_ngrok: as the name implies, installs ngrok on your cmoputer
auth_ngrok: authorizes ngrok using your personal access token

# future build: use the ngrok API to set up custom domains, tunnels, etc.
