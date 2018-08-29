# Force shutdown systemd services

## Usage

It can get pretty tedious to manually shutdown systemd services with an override file on Linux Distros with Systemd.
This script solves it by letting you shutdown any service. It creates an override to the systemd service you input with a 10 second shutdown timer. For safety reasons I implemented a check if the service really exists.

Tested on Ubuntu 18.04 Server




##### Made by RKara
