def wp_docker_exec
    config_manager = ConfigManager.new
    name = config_manager.get_wp_container_name
    args = ARGV
    args.slice!(0)

    command="docker exec -it " + name + " " + args.join(" ")
    system(command)
end