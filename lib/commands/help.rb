def wp_docker_help
puts """
Usage wp-docker <command> [<options>]

Commands:
  create                         Create new wp-docker environment
  list                           Show available environments
  cli <command>                  Execute wp-cli in current wp-docker environment
  open                           Open browser
  shell                          Open shell in web container
  exec <command>                 Execute command in current wp-docker environment
  start [<environment>]          Start wp-docker environment (default: current)
  stop <environment>             Stop wp-docker environment
  remove <environment>           Remove wp-docker environment
  logs [-t]                      Show apache web logs
  help                           Show this help
  
"""
end
