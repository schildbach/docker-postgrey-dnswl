## Postgrey Docker image with DNSWL patch

This Docker image runs [Postgrey](http://postgrey.schweikert.ch/) from the [Mail-In-A-Box PPA](https://launchpad.net/~mail-in-a-box/+archive/ubuntu/ppa). That version of Postgrey includes a [patch](https://github.com/mail-in-a-box/mailinabox/blob/65add24e2abcc0015d7a49645218e13e37e7d5b6/ppa/postgrey_sources.diff) which makes use of DNSWL.org for additional whitelisting.

## Running

    docker run -d -p 10023:10023 mazzolino/postgrey-dnswl

Now Postgrey is listening on port 10023 for Postfix access policy connections. It should be added to Postfix's _main.cf_ like this:

    smtp_recipient_restrictions =
      ...
      check_policy_service inet:127.0.0.1:10023

_Note:_ Postgrey probably shouldn't be exposed externally on your host. So instead of exposing the port, use the container network IP or create a Docker network for connecting to the daemon.
