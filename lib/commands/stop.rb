def wp_docker_stop
  config_manager = ConfigManager.new

  if ARGV.count == 2
    env = ARGV[1]
  else
    env = config_manager.get_wp_environment_name
  end

  if env != nil
    docker_manager = DockerManager.new
    docker_manager.stop env
  end

end