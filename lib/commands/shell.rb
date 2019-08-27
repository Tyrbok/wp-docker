def wp_docker_shell
  config_manager = ConfigManager.new

  if ARGV.count == 2
    container = "wpd_web_" + ARGV[1]
  else
    container = config_manager.get_wp_container_name
  end

  if container != nil
    command = "docker exec -it " + container + " /bin/bash"
    puts " - Executing: " + command
    puts
    system(command)
  end
end