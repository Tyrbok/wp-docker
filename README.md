# WP-Docker

The easiest way to develop WordPress using Docker containers.

## Install

```
# Using RubyGems
$ sudo gem install wp-docker
```

## Usage

WP-Docker provides a command-line interface to create and manage WordPress development environments using Docker:

```
$ wp-docker 

==================================
| WP-Docker 0.1.2                |
==================================

Usage wp-docker <command> [<options>]

Commands:
  create                         Create new wp-docker environment
  list                           Show available environments
  cli <command>                  Execute wp-cli in current wp-docker environment
  open                           Open browser
  shell [<environment>]          Open shell in web container
  exec <command>                 Execute command in current wp-docker environment
  start [<environment>]          Start wp-docker environment (default: current)
  stop [<environment>]           Stop wp-docker environment (default: current)
  remove [<environment>]         Remove wp-docker environment (default: current)
  logs [-t]                      Show apache web logs
  help                           Show this help
```

## Contributing

* If you have found a bug or if you have a feature request, please report them at this repository issues section.
* Pull requests must be made against develop branch.
