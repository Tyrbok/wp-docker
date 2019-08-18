def wp_docker_shell
    config_manager = ConfigManager.new
    name = config_manager.get_wp_container_name
    command="docker exec -it " + name + " /bin/bash"
    puts command
    system(command)
end