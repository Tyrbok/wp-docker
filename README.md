# WP-Docker

The easiest to for WordPress using Docker containers

## Install

```
# Using RubyGems
$ sudo gem install wp-docker
```

## Usage

WP-Docker provides a command-line interface to create and manage WordPress development environments using Docker:

```
$ wp-docker 

========================================
| WordPress Docker Environment Manager |
========================================

Usage wp-docker <command> [<options>]

Commands:
  create                         Create new wp-docker environment
  list                           Show available environments
  cli <command>                  Execute wp-cli command
  open                           Open browser
  shell                          Open shell in web container
  exec <command>                 Execute command inside container
  start <environment>            Start wp-docker environment
  stop <environment>             Stop wp-docker environment
  remove <environment>           Remove wp-docker environment
  logs [-t]                      Show apache web logs
  help                           Show this help
```


## Contributing

* If you have found a bug or if you have a feature request, please report them at this repository issues section.
* Pull requests must be made against develop branch.
