def wp_docker_execute_cli 
    config_manager = ConfigManager.new
    name = config_manager.get_wp_container_name
    args = ARGV
    args.slice!(0)

    command="docker exec -it " + name + " wp --allow-root " + args.join(" ")
    system(command)
end
