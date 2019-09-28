def wp_docker_execute_cli 
    config_manager = ConfigManager.new
    unless config_manager.is_docker_compose_folder
        puts "docker-compose.yml does not exists in current folder."
        puts
        exit
    end
    name = config_manager.get_wp_container_name
    args = ARGV
    args.slice!(0)

    command="docker exec -t " + name + " wp --allow-root " + args.join(" ")
    system(command)
    puts
end
