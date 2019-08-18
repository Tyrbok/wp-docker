

def wp_docker_list 
    docker_manager = DockerManager.new

    environments = docker_manager.get_environments
    puts fill_spaces("Environment", UI_ENV_SPACES) + fill_spaces("Web Port", UI_WEB_SPACES) + fill_spaces("DB Port", UI_DB_SPACES)
    puts ("-" * (UI_ENV_SPACES + UI_WEB_SPACES + UI_DB_SPACES))
    environments.each do |env| 
        puts fill_spaces(env["env"], UI_ENV_SPACES) + fill_spaces(env["web_port"], UI_WEB_SPACES) + fill_spaces(env["db_port"], UI_DB_SPACES)
    end
    puts 
end