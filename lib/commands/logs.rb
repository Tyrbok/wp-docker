def wp_docker_logs
    config_manager = ConfigManager.new
    name = config_manager.get_wp_container_name

    tail_option = ""
    if ARGV.count == 2
        if ARGV[1] == "-t"
            tail_option = " -f"
        else
            wp_docker_help
            exit
        end
    end

    command="docker logs " + name + tail_option
    system(command)
end
