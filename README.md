# Focus

Focus adds domains of your choice to /etc/hosts. It block them through comments.

## Install

Somewhere in your $PATH:

```
curl https://raw.githubusercontent.com/davejachimiak/focus/master/focus > focus
chmod +x ./focus
```

## Usage and Commands

```
USAGE: focus <command> [<arg>]

COMMANDS:

focus activate                 Activate focus. This uncomments domains added to focus in /etc/hosts.
focus add <domain>             Add <domain> to focus block in /etc/hosts.
focus deactivate               De-activate focus. This comments-out added domains in /etc/hosts.
focus help                     Print this help text.
focus list                     List all domains that have been added to /etc/hosts through focus.
focus remove <domain>          Remove <domain> from focus block in /etc/hosts.
focus status                   Tell whether focus is activated or de-activated.
```

## Examples

Add facebook.com to focus block in /etc/hosts:

```sh
sudo focus add facebook.com
```

Remove facebook.com from focus block:

```sh
sudo focus remove facebook.com
```

List domains added with focus:

```sh
focus list
```

Redirect added domains to 127.0.0.2

```sh
sudo focus activate
```

Stop redirecting added domains to 127.0.0.2:

```
sudo focus deactivate
```

Print whether focus is activated:

```
focus status
```

## How it works

focus adds domains to /etc/hosts in a block surrounded by "#focus#" and
"#eofocus". If focus is deactivated, adding domains will add them commented to
/etc/hosts.

```
#focus#
#127.0.0.2 facebook.com
#eofocus#
```

Activating focus will uncomment the domains.

```
#focus#
127.0.0.2 facebook.com
#eofocus#
```

Adding domains while focus is activated will add them to the block uncommented.

```
#focus#
127.0.0.2 facebook.com
127.0.0.2 twitter.com
#eofocus#
```
