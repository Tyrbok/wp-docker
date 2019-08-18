def wp_docker_open_browser
    config_manager = ConfigManager.new
    port = config_manager.get_wp_container_port

    command="open http://localhost:" + port
    system(command)
end