def wp_docker_help
    puts "Usage wp-docker <command> [<options>]"
    puts 
    puts "Commands:"        
    puts "  create                         Create new wp-docker environment"
    puts "  list                           Show available environments"
    puts "  cli <command>                  Execute wp-cli in current wp-docker environment"
    puts "  open                           Open browser"
    puts "  shell                          Open shell in web container"
    puts "  exec <command>                 Execute command in current wp-docker environment"
    puts "  start <environment>            Start wp-docker environment"
    puts "  stop <environment>             Stop wp-docker environment"
    puts "  remove <environment>           Remove wp-docker environment"
    puts "  logs [-t]                      Show apache web logs"
    puts "  help                           Show this help"
    puts
end
